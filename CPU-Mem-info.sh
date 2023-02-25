#!/bin/bash
file=$(cat namespaces.txt)
for i in $file
    do
        kubens $i
        kubectl describe deployment | egrep '(Name:|cpu|memory)' |  awk '{print $1,$2}'
    done > result
echo "End"
