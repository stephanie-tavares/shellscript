for i in $(kubectl get pods -A | grep Crash | awk '{print $1,$2}'| tr -s ' ' ':')
        do 
        namespace=$(echo $i | cut -f1 -d:)
        pod=$(echo $i | cut -f2 -d:)
            kubectl delete pods $pod -n $namespace 
        done
