
terraform-aks-prod/
├── provider.tf
├── backend.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
├── modules/
│ ├── resource-group/
│ ├── network/
│ ├── private-dns/
│ ├── log-analytics/
│ ├── acr/
│ ├── aks/
│ ├── keyvault/
│ └── role-assignments/