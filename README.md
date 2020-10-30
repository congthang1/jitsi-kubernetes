# jitsi-kubernetes-scalable-service-with-octo

Kubernete deployment with autoscale JVB and OCTO enabled
Kubernetes 1.18.10

This repo is origin from https://github.com/DushmanthaBandaranayake/jitsi-kubernetes-scalable-service
Thanks for this great work but I need to make it a different way.

There are 4 parts of this deploy, each will be on a kuberenetes. Meaning you need 4 kubernetes for 2 regions or 2 kubernetes for only 1 region. The autoscale will not work if you put jvb on the same Web Prosody kubernetes.
JVB nodes need at least 2 cpu

0. Search for all place in the code marked as: ``<< update this >> `` and update them!

1. Deploy main jitsi web server on kubernetes shard 0:

    - Connect ``kubectl`` to kuberenets shard 0

    - Create kubernetes namespace 
    
    ``kubectl create namespace jitsi``
    
    - go to /base

    ``kubectl apply -f config.yaml``
    
    - go to /shard0/web
    
    ``kubectl apply -f jicofo.yaml``
    
    ``kubectl apply -f web-configmap.yaml``
    
    - go to /base/web-base
    
    ``kubectl apply -f web-configmap.yaml``
    
    ``kubectl apply -f jicofo-configmap.yaml``
    
    ``kubectl apply -f service.yaml``
    
    ``kubectl apply -f web-prosody.yaml``
    
    
2. Deploy the JVBs on kubernetes jvb-shard0

    - Connect ``kubectl`` to kuberenets jvb-shard0

    Make sure udp port open on jvb node: udp 31000-30006 and OCTO udp port 30960 - 30966. with Digitalocean can use firewall with tag start with k8.. added by default to apply firewall to all nodes.
    
    ``kubectl create namespace jitsi``
    
    - go to /base
    
    ``kubectl apply -f config.yaml``
    
    - go to /jvb-base
    
    ``kubectl apply -f server_metrics.yaml``
    
    ``kubectl apply -f jvb-configmap.yaml``
    
    ``kubectl apply -f service.yaml``
    
    - got o /shard0/jvb
    
    ``kubectl apply -f jvb-statefullset.yaml``
    

3. Deploy the second web server region on kubernetes shard1 (optional)

    - Connect ``kubectl`` to kuberenets shard1

    - Create kubernetes namespace 
    
    ``kubectl create namespace jitsi``
    
    - go to /base
    
    ``kubectl apply -f config.yaml``
    
    - go to /shard1/web
    
    ``kubectl apply -f web-configmap.yaml``
    
    - go to /base/web-base
    
    ``kubectl apply -f web-configmap.yaml``
    
    ``kubectl apply -f service.yaml``
    
    ``kubectl apply -f web-prosody.yaml``
    
4. Deploy the JVBs on kubernetes jvb-shard1 (if you have step 3)

    - Connect ``kubectl`` to kuberenets jvb-shard1

    Make sure udp port open on jvb node: udp 31000-30006 and OCTO udp port 30960 - 30966
    
    ``kubectl create namespace jitsi``
    
    - go to /base
    
    ``kubectl apply -f config.yaml``
    
    - go to /jvb-base
    
    ``kubectl apply -f server_metrics.yaml``
    
    ``kubectl apply -f jvb-configmap.yaml``
    
    ``kubectl apply -f service.yaml``
    
    - got o /shard1/jvb
    
    ``kubectl apply -f jvb-statefullset.yaml``
    

Your scaleable jitsi with octo will be avaiable at the main domain! On digitalocean point your domain to the load balancer created on kuberenets main web and second region one. You need to set certificate there too for port 443 on setting of load balancer.
If you have more region just redo from step 3