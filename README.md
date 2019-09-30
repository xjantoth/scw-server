# Project structure

```bash
tree -L 2   
.
├── conf
│   ├── auth.py
│   ├── __init__.py
│   └── server.sh
├── main.tf
├── modules
│   ├── security_group
│   └── server
├── outputs.tf
├── README.md
├── terraform.server.tfvars
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf

4 directories, 10 files
```

## How to run terraform code with -var-file option

```bash
terraform fmt -recursive
terraform validate
terraform plan  -var-file=terraform.server.tfvars 
terraform apply  -var-file=terraform.server.tfvars 
terraform destroy  -var-file=terraform.server.tfvars 

```

## Create terraform.server.tfvars

```bash
# General
# General

scw_region            = "par1"
scw_token             = "..."
scw_organization      = "..."
operating_system      = "CentOS 7.6"
instance_type         = "DEV1-S"
server_script_initial = "server.sh"
name                  = "server-name"
tags                  = ["wings", "terraform"]
enabled               = "true"
```

## Create or fill in conf/auth.py file

```bash
# Linux example
login = {
    "username" : "...",
    "password" : "...",
    "url_token": "...",
    "url_list": "...",
    "day_tamplate": "particular_day_navbar.tpl",
    "reg_template": "particular_day.tpl",
    "detail_list_view_tpl": "detail_list_view.tpl",
    "jumbo_tpl": "jumbo.tpl",
    "main_template": "main.tpl",
    "database_path": "/opt/2w.sqlite",
    "app_home": "/opt/flights"
}

#  Windows example
login = {
    "username" : "...",
    "password" : "...",
    "url_token": "...",
    "url_list": "...",
    "day_tamplate": "particular_day_navbar.tpl",
    "reg_template": "particular_day.tpl",
    "detail_list_view_tpl": "detail_list_view.tpl",
    "jumbo_tpl": "jumbo.tpl",
    "main_template": "main.tpl",
    "database_path": "C:\\users\\some-username\\flights\\2w.sqlite",
    "app_home": "C:\\users\\some-username\\flights"
}
```

## Install scaleway-cli

```bash
yay -S terraform-docs
sudo pip install pre-commit
```

## Setup pre-hooks

```bash
cat <<EOF > .pre-commit-config.yaml
- repo: git://github.com/antonbabenko/pre-commit-terraform
  rev: v1.18.0
  hooks:
    - id: terraform_fmt
    - id: terraform_docs
EOF

pre-commit install
pre-commit run -a
```