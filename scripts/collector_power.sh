#!/bin/bash

hawkular_cli="hawkular-client-cli -U http://localhost:8443 -T t -t ops"
readings=($(modbus-cli readi -u powermeter.example.com -a 1 -t float -l 18))
keys=(volt1 volt2 volt3 volt12 volt23 volt31 current1 current2 current3)

n=0
while [[ $n -lt 9 ]]; do
  values="${values} ${keys[$n]}=${readings[$n]}"
  n=$(($n+1))
done

$hawkular_cli $values

