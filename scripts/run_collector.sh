#!/bin/bash

echo "running $1"
while true; do $1; sleep 5; printf .; sleep 5; done
