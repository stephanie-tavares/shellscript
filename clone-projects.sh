#!/bin/bash/
value=cat list.txt
for i in $value
do
    kubectx <namespace-prod>
    kubectl get hpa -n $i -o yaml > $i-update.yaml
    kubectx <namespace-homolog>
    kubectl -n argocd patch --type='merge' application $i-hom -p "{\"spec\":{\"syncPolicy\":null}}"
    gsed -i 's/prod/hom/g' $i-update.yaml
     kubectl -n $i replace -f $i-update.yaml --force
     echo "Done"
done
