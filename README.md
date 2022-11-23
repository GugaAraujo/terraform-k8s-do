# Terraform Challenge

For this challenge, we need a script that automates infrastructure management,<br>
provisioning a WordPress application and a MySQL database.

The entire flow must be run only once.

The application can be accessed at the address
#### [https://www.laboratoriolotus.com.br/](https://www.laboratoriolotus.com.br/)

### 🚧 Project in progress

## Setup

```bash
# install modules and backend
$ terraform init

# create a plan for changes
$ terraform plan

# apply changes
$ terraform apply

# apply changes
$ terraform apply "do_token=<YOUR_TOKEN_HERE>"

# apply changes without confirmation
$ terraform apply --auto-approve -var "do_token=<YOUR_TOKEN_HERE>"
```

