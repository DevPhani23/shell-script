#!/bin/bash

COURSE="Devops from current script"
echo "Before calling other script, course: $COURSE"
echo "Process ID of current shell Script:$$"

#other script calling

./16-other-script-call.sh

echo "After calling script, course: $COURSE"