#!/bin/bash
set -ex

echo "Setting up server."

function allow_fw_port () {
  local port="$1"
  local protocol="$2"

  firewall-cmd --permanent --add-port=${port}/${protocol}
}

yum install \
git vim wget \
curl gcc python3 \
python3-devel \
firewalld yum-utils \
certbot python2-certbot-nginx \
nginx -y

for SOFTWARE in firewalld nginx; do
  systemctl enable ${SOFTWARE} && systemctl start ${SOFTWARE}
done

for couple in 80:tcp 443:tcp; do
  PORT=$(echo ${couple} | awk -F":" '{print $1}')
  PROTOCOL=$(echo ${couple} | awk -F":" '{print $2}')
  allow_fw_port ${PORT} ${PROTOCOL}
done

firewall-cmd --reload
firewall-cmd --zone=public --list-all
setsebool httpd_can_network_connect on -P


git clone https://github.com/xjantoth/flights.git /opt/flights


FLIGHT_PATH=/opt/flights 
CRON=/var/spool/cron/root

cd /opt && python3 -m venv venv3
source /opt/venv3/bin/activate

cd ${FLIGHT_PATH}

git checkout production
pip install -r requirement.txt
cp /opt/auth.py /opt/flights/auth.py


 
cd ${FLIGHT_PATH} 
/opt/venv3/bin/python \
/opt/venv3/bin/gunicorn \
--bind 0.0.0.0:5000 \
--workers=3 \
wsgi:app \
-p flask_app.pid \
-D \
--error-logfile error.log
sleep 17;
curl http://localhost:5000/ &>  /dev/null || :

/opt/venv3/bin/python /opt/flights/feed_db_with_flight_data.py

CMD_PATH="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin"

JOB1="@reboot FLIGHT_PATH=/opt/flights cd $FLIGHT_PATH && /opt/venv3/bin/python /opt/venv3/bin/gunicorn --bind 0.0.0.0:5000 --workers=3 wsgi:app -p flask_app.pid -D --error-logfile error.log"
JOB2="*/5 * * * *  /opt/venv3/bin/python /opt/flights/feed_db_with_flight_data.py >> /opt/flights/error_log.log 2>&1"
JOB3="0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew"

echo "$CMD_PATH" >> $CRON
echo "$JOB1" >> $CRON
echo "$JOB2" >> $CRON
echo "$JOB3" >> $CRON

sqlite3 /opt/2w.sqlite "CREATE INDEX fast_search_index ON flight_data (created);"

# sqlite3 test.db "select * from abc;" ".exit"

