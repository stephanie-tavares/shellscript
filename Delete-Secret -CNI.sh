#!/bin/bash
echo "delete secret CNI"
kubectl delete secrets -n kube-system sh.helm.release.v1.aws-vpc-cni.v1
sleep 5
echo "secret deleted"
