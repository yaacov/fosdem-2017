#!/bin/bash

hawkular_cli="hawkular-client-cli -U http://localhost:8080 -T t -t ops"
readings=($(timeout 5s modbus-cli readi -u 10.201.132.40 -a 0 -l 3))
#readings=($(timeout 5s modbus-cli readi -u modbus.local -a 0 -l 3))
keys=(temp humidity dew-point)

if [[ $readings == *"T"* ]]; then
  echo "Readings timeout"
  exit
fi

n=0
while [[ $n -lt 3 ]]; do
  val=$(bc <<< "scale=2; 0${readings[$n]}/100")
  values="${values} ${keys[$n]}=${val}"
  n=$(($n+1))
done

echo $values

if [[ $values == *"= "* ]]; then
  echo "Bad readings"
  exit
fi

$hawkular_cli $values

