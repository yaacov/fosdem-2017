#!/bin/bash

echo "running $1"
while true; do $1; printf .; sleep 2; done
