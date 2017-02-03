#!/bin/bash

hawkular_cli="hawkular-client-cli -U http://localhost:8080 -T t -t ops"
readings=($(timeout 5s modbus-cli readi -u powermeter.example.com -a 1 -t float -l 18))
keys=(volt1 volt2 volt3 volt12 volt23 volt31 current1 current2 current3)

if [[ $readings == *"T"* ]]; then
  echo "Readings timeout"
  exit
fi

n=0
while [[ $n -lt 9 ]]; do
  values="${values} ${keys[$n]}=${readings[$n]}"
  n=$(($n+1))
done


if [[ $values == *"= "* ]]; then
  echo "No readings"
  exit
fi

if [[ $values == *"=0 "* ]]; then
  echo "Zero readings"
  exit
fi

echo $values
$hawkular_cli $values


