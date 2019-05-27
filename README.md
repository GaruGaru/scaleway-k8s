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

terraform apply -var='scw_organization_id=<ORGANIZATION_ID>' -var 'scw_secret_token=<SECRET>'
``` 
