# Terraform

- Terraform is an opensource IAC tool.
- Reusable
- Easy to manage infra
- Store current state of infra
- MultiCode 

----------

## Terraform Language

- Syntax:
    key = value
- No Indentation specific. {} to define blocks.
- HashiCorp Configuration Language.
- Terraform Configuration Files
- .tf / .tf.json
- Block Specify

    - provider "<PROVIDER-NAME>" {}
    - resource "<RESOURCE-TYPE>" "<RESOURCE-NAME>" {}
    - data
    - variable
    - output
    - module
    - terraform

- HW, Take SSH Connection from Putty

- Resource configuratio status:
    - "+" New create
    - "-" Delete
    - "~" Change / edit


## Terraform Lifecycle
- terraform init - intialize the terraform configuration. Providers plugin download, module load, backend load.
.terraform/
.terraform.d/
- terraform plan - blueprint of infra after apply
- terraform apply - apply the terraform configuration
terraform.tfstate
terraform.tfstate.backup
- terraform destroy - delete the terraform configuration


Practical: 
1> Terraform Installation
2> Write first terraform script
3> Implement terraofrm lifecycle





Data Type:

Number: 1234253
String: "Hello World", "My Name is 123SHUBHAM"
List: ["Shubham", "Rajat", "Priyanka", "Nitin"]
Map: {name= "shubham", city = "nagpur"}
Bool: True, False, 0, 1


list = []
map = {}
block {}


### Modules
- Terraform scripts that can be reused



### terraform.tfstate
instance = t2.medium

tf apply -var-file=dev.tfvar
tf apply -var-file=prod.tfvar


terraform workspace  - terraform.tfstate 

dev - terraform.tfstate
prod - terraform.tfstate

## HomeWork
### Host static website on s3 bucket
### create eks cluster
### create mysql db_instance in RDS
