#!/bin/bash

printf "Absolute pathname used to invoke the shell (only when used first in script beofre other commands) \n \$_ = $_\n"
printf "Test command for alternate \$_ example 'date -u'\n "
date -u
printf "Last argument to the previous command\n \$_ = $_\n\n"
printf "1st argument\n \$1 = $1\n"
printf "2nd argument\n \$2 = $2\n"
printf "3rd argument\n \$3 = $3\n"
printf "The name the script was invoked with\n \$0 = $0\n\n"
printf "Number of command line arguments\n \$# = $#\n\n"
printf "All command line arguments, enclosed in quotes\n \$@ = $@\n\n"
printf "Lesser used version of \$@, changes arguments like \"one two\" into \"one\" \"two\"\n \$* = $*\n\n"
printf "Exit status of the most recent pipeline\n \$? = $?\n\n"
printf "Current option flags (the single-letter option names concatenated into a string) as specified on invocation\n \$- = $-\n\n"
printf "Process ID of the invoked shell\n \$$ = $$\n\n"
printf "Process ID of the most recent background command executed from the current shell.  For a pipeline, the process ID is that of the last command in the pipeline.\n \$! = $!\n\n"

echo "Print command line arguments: ($#)"
while [ $# -gt 0 ]
do
    echo " $1"
    shift
done
