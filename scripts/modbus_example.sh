#!/bin/bash

# >> modbus-cli --help
#	Usage: modbus-cli <command> [options]
#
#	Commands:
#	  read   Read holding registers
#	  readi  Read input registers
#	  force  force single coil
#
#	Options:
#	  --config    Path to JSON config file
#	  -h, --help  Show help                                                [boolean]
#
#	Examples:
#	  /home/yzamir/node_modules/.bin/modbus-cl  read one register at address 5
#	  i read -u 192.168.1.11 -a 5


# install
# >> npm install modbus-cli

# run a modbus client to collect powermeter readings as floats
modbus-cli readi -u powermeter.example.com -a 1 -t float -l 18; echo
