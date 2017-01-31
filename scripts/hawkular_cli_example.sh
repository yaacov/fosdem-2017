#!/bin/bash

# >> hawkular-client-cli --help
#	usage: hawkular-client-cli [-h] [-U URL] [-i] [-t TENANT] [-c [CONFIG_FILE]]
#		                   [-p [PASSWORD]] [-T [TOKEN]] [-u [USERNAME]]
#		                   [-a [TAG=VALUE [TAG=VALUE ...]]]
#		                   [-k [KEY [KEY ...]]] [-l] [-r]
#		                   [-m {gauge,counter,string,availability}]
#		                   [-s [START]] [-e [END]] [-b [BUCKETDURATION]]
#		                   [--limit [LIMIT]] [--auto-api] [-V] [--status]
#		                   [--triggers] [-N] [-v]
#		                   [KEY=VALUE [KEY=VALUE ...]]
#
#	Read/Write data to and from a Hawkular metric server.
#
#	positional arguments:
#	  KEY=VALUE             key value pairs to send
#
#	optional arguments:
#	  -h, --help            show this help message and exit
#	  -U URL, --url URL     Hawkualr server url
#	  -i, --insecure        allow insecure ssl connection
#	  -t TENANT, --tenant TENANT
#		                Hawkualr tenenat name
#	  -c [CONFIG_FILE], --config [CONFIG_FILE]
#		                Configurations file path
#	  -p [PASSWORD], --password [PASSWORD]
#		                Hawkualr server password
#	  -T [TOKEN], --token [TOKEN]
#		                Hawkualr server token
#	  -u [USERNAME], --username [USERNAME]
#		                Hawkualr server username
#	  -a [TAG=VALUE [TAG=VALUE ...]], --tags [TAG=VALUE [TAG=VALUE ...]]
#		                a list of tags [ when used with a list of keys, will
#		                update tags for this keys ]
#	  -k [KEY [KEY ...]], --keys [KEY [KEY ...]]
#		                a list of keys [ when used with a list of tags, will
#		                update tags for this keys ]
#	  -l, --list            list all registered keys, can be used with --tags
#		                argument for filtering
#	  -r, --read            read data for keys or tag list [requires the --keys or
#		                --tags arguments]
#	  -m {gauge,counter,string,availability}, --metric {gauge,counter,string,availability}
#		                use specific metrics type [gauge, counter, string,
#		                availability]
#	  -s [START], --start [START]
#		                the start date for metrics reading
#	  -e [END], --end [END]
#		                the end date for metrics reading
#	  -b [BUCKETDURATION], --bucketDuration [BUCKETDURATION]
#		                the metrics atatistics reading bucket duration in
#		                secondes
#	  --limit [LIMIT]       limit for metrics reading
#	  --auto-api            check api version before query server
#	  -V, --verbose         be more verbose
#	  --status              query hawkular status
#	  --triggers            query hawkular alert triggers
#	  -N, --no-autotags     do not update tags using the config file
#	  -v, --version         print version

# install
# >> pip install hawkular-client-cli

# run a hawkular client to list all available keys
hawkular-client-cli -T token -U http://localhost:8080 -t demo -l
