#!/bin/bash
# This script demonstrates the use of variables in shell scripting
# Variable declaration using commands in variable assignment

startdate=$(date +%s)
echo "Script started at: $startdate"
sleep 5 # Simulating some work by sleeping for 5 seconds    

enddate=$(date +%s)
echo "Script ended at: $enddate"
duration=$((enddate - startdate))
echo "Script execution time: $duration seconds"