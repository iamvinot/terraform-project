## Terraform

Terraform is an infrastructure as code tool that lets you build, change, and version cloud and on-prem resources safely and efficiently.

### Terraform Commands

#### Format and Validate Terraform code

Format code per HCL canonical standard

```bash
terraform fmt 
```

Validate code for syntax

```bash
terraform validate 
```

#### Initialize your Terraform working directory

```bash
terraform init 
```

#### Plan, Deploy and Cleanup Infrastructure

Check the deployment plan

```bash
terraform plan 
```

Apply changes without being prompted to enter “yes”

```bash
terraform apply --auto-approve 
```

Destroy plan

```bash
terraform destroy 
```

Reconcile the state in Terraform state file with real-world resources

```bash
terraform refresh 
```
