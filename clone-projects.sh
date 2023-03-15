#!/bin/bash/
value=cat list.txt
for i in $value
do
    kubectx BaaS-Polus-prod
    kubectl get hpa -n $i -o yaml > $i-update.yaml
    kubectx BaaS-Polus-hom
    kubectl -n argocd patch --type='merge' application $i-hom -p "{\"spec\":{\"syncPolicy\":null}}"
    gsed -i 's/prod/hom/g' $i-update.yaml
     kubectl -n $i replace -f $i-update.yaml --force
     echo "Done"
done
