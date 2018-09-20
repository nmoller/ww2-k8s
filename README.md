# Utilisation with minikube

### Preliminaries

Have `kubectl` and `minikube` installed.

Tested with version k8s 1.10.

Start minikube and be sure that you are in the correct context:
```
kubectl config get-contexts
```
The minikube one must have an `*` to its left.

To monitor that everything goes as expected, open the k8s dashboard with the command
```
minikube dashboard
```

Once the dashbord opens, you are going to need the ip there to modify accordingly the value `ENV WEBWORK_ROOT_URL`
in the `webworkdep.yaml` file.

### 1 Create ns

```
kubectl create ns test001
```

### 2 Generate the disks

```
 kubectl create -f disks.yaml
```

### 3 Create the services 

```
kubectl create -f services.yaml
```

Before continuing, be sure that the `Persistent Volume Claims` are in bounded status.

### Deploy the db server

```
kubectl create -f mariadbdep.yaml
```

Wait until the mariadb container is fully provisioned. To do that, in the namespace `test001` ... watch the logs of the pod `mariadb-[....]` (Pods.. select the pod,... at your right in the upper corner.. the logs link is there)

On the logs page click `>|` to update the logs.

### And finally WebWork up

```
kubectl create -f webworkdep.yaml
```

Watch the logs of the webwork pod 
