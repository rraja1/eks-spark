#Local Setup 

##Installations 

### Terraform Install
- https://formulae.brew.sh/formula/terraform
  - `brew install terraform`
### Kubectl Install 
- https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#install-with-homebrew-on-macos
  - `brew install kubectl`
### AWS CLI Install 
- https://formulae.brew.sh/formula/awscli
  - `brew install brew install awscli`
### Helm Install 
- https://formulae.brew.sh/formula/helm
  - `brew install helm`

#To Create the Cluster 
- `terraform plan`
- `terraform apply`
  - `Yes` when asked whether to apply changes 

#To login to the Cluster 
## Updating the Local KubeConfig 
- `aws eks update-kubeconfig --name raghav-test-cluster`

## Useful Commands 

- Check what is on ur Helm list of repos 
  - `helm repo list`
- Add the spark-operator repo to helm 
  - `helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator`
- Creating a namespace for Spark Jobs (Optional but better to limit to single namespace)
  - `kubectl create ns spark-jobs`
- Installing the Spark Operator so that it can watch the Jobs in the `spark-jobs` namespace 
  - `helm install spark-operator-release spark-operator/spark-operator --namespace spark-operator --create-namespace --set sparkJobNamespace=spark-jobs`
- To check if spark operator has been installed and running 
  - `kubectl get all -n spark-operator`
- Checking status of the release 
  - `helm status spark-operator-release -n spark-operator`
- Creating a service account and the cluster-role-binding
  - `kubectl apply -f spark-operator/roles/cluster-role-binding.yaml`
- Check the service account created 
  - `kubectl get serviceaccount`
- Check the rolebindings created 
  - `kubectl get clusterrolebinding`
- Running the job
  - `kubectl apply -f spark-operator/jobs/example.yaml`
- Get all Spark Applications
  - `kubectl -nspark-jobs get sparkapplication`
- Check the pods for the spark application 
  - `kubectl get pods -nspark-jobs`
- Checking logs for a pod
  - `kubectl -nspark-jobs logs -f pod/pyspark-pi-driver`
- Deleting the spark application
  - `kubectl delete sparkapplication pyspark-pi -nspark-jobs`
- Portforward the UI 
  - `kubectl port-forward service/pyspark-pi-ui-svc 4040:4040`