#!/bin/bash

# Check if there are any tasks (using wmctrl as an example, you can modify this based on your environment)
tasks=$(wmctrl -l)

if [ -z "$tasks" ]; then
    echo "{\"text\":\"\",\"class\":\"empty\",\"percentage\":0}"
else
    echo "{\"text\":\"icon\",\"class\":\"tasks\",\"percentage\":100}"
fi