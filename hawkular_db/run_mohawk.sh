#!/bin/bash

#>> mohawk --help
#   Usage of mohawk:
#     -api string
#       	the hawkulr api to mimic [e.g. 0.8.9.Testing, 0.21.2.Final] (default "0.21.0")
#     -backend string
#       	the backend to use [random, sqlite] (default "random")
#     -port int
#       	server port (default 8443)
#     -tls string
#       	use TLS server (default "true")

# run mohawk with sqlite backend
mohawk -backend sqlite -port 8080 -tls false 2> /dev/null
