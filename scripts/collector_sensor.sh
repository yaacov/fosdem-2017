#!/bin/bash

hawkular_cli="hawkular-client-cli -U http://localhost:8443 -T t -t ops"
readings=($(modbus-cli readi -u modbus.local -a 0 -l 3))
keys=(temp humidity dew-point)

n=0
while [[ $n -lt 3 ]]; do
  val=$(bc <<< "scale=2; ${readings[$n]}/100")
  values="${values} ${keys[$n]}=${val}"
  n=$(($n+1))
done

$hawkular_cli $values

