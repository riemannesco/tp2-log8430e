#!/bin/bash

#if [ -z "$workload" ]
#  then
#    echo "No argument supplied"
#    exit 1
#fi

rm outputLoad.txt
rm outputRun.txt
for workload in "workloada" "workloadc"
do
    for i in {1..10}
    do
        echo "Test #$i" 
        bash ycsb-0.17.0/bin/ycsb.sh load mongodb -s -P ycsb-0.17.0/workloads/$workload -p operationcount=50000 -p recordcount=50000 >> outputLoad-$workload.txt; 
        bash ycsb-0.17.0/bin/ycsb.sh run mongodb -s -P ycsb-0.17.0/workloads/$workload -p operationcount=50000 -p recordcount=50000 >> outputRun-$workload.txt; 
        mongosh --eval "use ycsb" --eval  "db.dropDatabase()"
	# ./bin/ycsb load redis -P workloads/workloada -p "redis.host=172.18.0.2" -p "redis.port=7000" -p "operationcount=50000" -p "recordcount=50000" >> outputRun-$wordload.txt;
	# ./bin/ycsb run redis -P workloads/workloada -p "redis.host=172.18.0.2" -p "redis.port=7000" -p "operationcount=50000" -p "recordcount=50000" >> outputRun-$wordload.txt;

    done
done
