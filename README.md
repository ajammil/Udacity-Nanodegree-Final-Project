# Capstone Project


This project is a docker container, hosted on a kubernetes cluster along with Jenkins and a Jenkins pipeline that builds, pushes to docker hub. Then it trigers an update to the kubernetes cluster using "kubectl set" command.
I used an AWS EKS cluster to host my kubernetes with an EC2 worker node.
## Requirements
  - Kubernetes cluster 
 

# How to run!

  - Setup your jenkins pipeline with:
  AWS keys,
  GitHub webhooks,
  docker pipeline,
  and kubeconfig.
  - run run_kubernetes.sh to intialize the cluster.
  - Whenever any commit is pushed to the repo, the pipeline will be triggered automatically and if successful, it will be pushed to the kubernetes cluster.



### Tech


* Docker
* Nginx
* Kuberenetes
* AWS EKS
* Jenkins



