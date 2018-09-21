# Utilisation with minikube

### Installations

[Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

[Minikube](https://github.com/kubernetes/minikube)

### Preliminaries

The original diagram of what is implemented: [One note link](https://1drv.ms/f/s!AlNsK5gd2-LsgSrhNY3P7pbtUbkO)

Have `kubectl` and `minikube` installed.

Tested with version k8s 1.10 in an Ubuntu 18.04.

Start minikube
```
minikube start
``` 
once the bootstrap process end, be sure that you are in the correct `kubectl` context:
```
kubectl config get-contexts
```
The minikube one must have an `*` to its left.

To monitor that everything goes as expected, open the k8s dashboard with the command
```
minikube dashboard
```

Once the dashboard opens, you are going to need the ip there to modify accordingly the value `ENV WEBWORK_ROOT_URL`
in the `webworkdep.yaml` file.

![Cluster IP](img/minik8IP.png)

In the picture case, you are going to use: `http://192.168.99.100:30070`

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


Tadammmm...

![Admin course](img/adminCourse.png)

We have a version of `WeBWork2` in kubernetes.

### Debugging in error case
If you need to run something in the mariadb container:
```
(master)$ kubectl -n test001 get pods
NAME                       READY     STATUS    RESTARTS   AGE
mariadb-65b4888f96-tpz9r   1/1       Running   1          17h
webwork-68f4bd9bb6-ftdzt   1/1       Running   1          16h
(master)$ kubectl -n test001 exec -it mariadb-65b4888f96-tpz9r -- mysql -u root -prandomepassword

# In the ww2 container :
kubectl -n test001 exec -it webwork-68f4bd9bb6-ftdzt -- bash
```

If something goes wrong in the `persistent storage`:

```
minikube ssh

cd /mnt/sda1/hostpath_pv/pv002
sudo rm -rf admin
```

To rebuild the database:

Delete the content of `/mnt/sda1/hostpath_pv/pv001` in the minikube machine.

### Disclaimer

:bomb:

:exclamation: It is intended to be a first experiment.... so please do not deploy in production :yum:

