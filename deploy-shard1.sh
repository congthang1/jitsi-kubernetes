#!/bin/bash
kubectl config use-context your-shard1-kubernet #<< update this >>
kubectl apply -f base/config.yaml
kubectl apply -f shard1/shard-config.yaml
kubectl apply -f base/web-base/web-configmap.yaml
kubectl apply -f base/web-base/web-prosody.yaml
kubectl apply -f base/web-base/service.yaml
# jvb
kubectl config use-context your-shard1-jvb #<< update this >>
kubectl apply -f base/config.yaml
kubectl apply -f shard1/shard-config.yaml
kubectl apply -f base/jvb-base/server_metrics.yaml
kubectl apply -f base/jvb-base/jvb-configmap.yaml
kubectl apply -f base/jvb-base/jvb-statefullset.yaml
kubectl apply -f base/jvb-base/service.yaml
kubectl apply -f base/jvb-base/hpa.yml
