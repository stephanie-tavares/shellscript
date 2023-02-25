#!/bin/bash
echo "What the namespace will be stoped?"
read app;
kubectl -n argocd patch --type='merge' application $app -p "{\"spec\":{\"syncPolicy\":null}}"
if
$(app='error')
then
echo "Application not found"
exit
else
echo "Application stopped with success"
fi
