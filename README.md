# jitsi kubernetes scalable service multi shards with OCTO

For Bigbluebutton k8s scale, checkout this repo https://github.com/congthang1/bigbluebutton-kubernetes-autoscale

Kubernete deployment with autoscale JVB and OCTO enabled
Kubernetes 1.18.10

Tested on Digital Ocean.

JVB nodes need at least 2 cpu

0. Search for all place in the code marked as: ``<< update this >> `` and update them! 

Make sure you have save your context connection to your kubernetes cluster on cloud.

1. Deploy main jitsi web server on kubernetes shard 0:

    ``./deploy-shard0.sh``

2. Deploy the second web server region on kubernetes shard1 (optional)

    ``./deploy-shard1.sh``

3. Deploy the second web server region on kubernetes shard1 (optional)

    ``./deploy-shard2.sh``
    

Your scaleable jitsi with octo will be avaiable at the main domain! On digitalocean point your domain to the load balancer created on kuberenets main web and second region one. You need to set certificate there too for port 443 on setting of load balancer.
If you have more region just redo from step 3
