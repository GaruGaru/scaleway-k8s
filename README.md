# Deploy kubernetes cluster on Scaleway using terraform

### Features 

* Multi node cluster

* CNI setup 

* Base RBAC setup 


#### WIP 

* Nginx ingress + let's encrypt  

* Persistence with Rook + Ceph 

* Metrics 


## How to run

```bash

terraform apply -var='scw_organization_id=e44e40a7-6cc3-4fe5-9edf-0d80834cc650' -var 'scw_secret_token=5952ed59-ef34-4e81-93ba-f7bacfa8f524'
``` 
