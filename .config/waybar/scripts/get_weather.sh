#!/bin/bash

weather=curl -s 'https://wttr.in/Philadelphia' |jq --unbuffered --compact-output -M -R '{text:.}'

if [[ $weather == "" ]]; then 
    echo ""
fi 