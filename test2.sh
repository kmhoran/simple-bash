#!/bin/sh

echo -e "\n# =========================== #"
echo "#           VARIABLES         #"
echo -e "# =========================== #\n"

## Variable allocation 
NAME="Compy"
echo $NAME

# ..................................
## Set variable to readonly ##
READ_ME="Don't change this value!"
readonly READ_ME

#- This line will throw an error
# READ_ME="no name"
# echo $READ_ME

# ..................................
## Unset variable to readonly ##
DELETE_ME="Now you see me.."
echo $DELETE_ME
unset DELETE_ME
#- This line won't print anything
echo $DELETE_ME

#- You can't unset readonly variables
#- This line will throw an error
# unset READ_ME

# =========================== #
#        VARIABLE TYPES       #
# =========================== #
# Local Variables :
#   A local variable is a variable 
#   that is present within the 
#   current instance of the shell. 
#   It is not available to programs 
#   that are started by the shell. 
#   They are set at the command prompt.
#
# Environment Variables :
#   An environment variable is 
#   available to any child process of 
#   the shell. Some programs need 
#   environment variables in order 
#   to function correctly. Usually, a 
#   shell script defines only those 
#   environment variables that are 
#   needed by the programs that it 
#   runs.
#
# Shell Variable : 
#   A shell variable is a special 
#   variable that is set by the shell 
#   and is required by the shell in 
#   order to function correctly. Some 
#   of these variables are environment 
#   variables whereas others are local 
#   variables.
#
echo -e "\n# =========================== #"
echo "#       SPECIAL VARIABLES     #"
echo -e "# =========================== #\n"
# ..................................
## Current Process ID ##

#- $0 represents the current process' Name
echo "Process Name:          $0"

#- $$ represents the current process' ID
echo "Process ID:            $$"

#- $# represents the number or arguments 
echo "Number of Arguments      " 
echo -e "  passed to process:   $#\n"

#- #? represents the exit process of the last command executed
echo "## Try run erroroneous command ##"
unset READ_ME
echo -e "Last command $! finished with exit code:  $? \n"

#- $@ and $* mean subtly different things
#- $@ takes all passed parameters as individual strings ( "one" "two" "three" )
#- $*  ''    ''    ''    '''      '' a singlew string   ( "one two three"")
#- you can access the individual parameters based on the order they were passed as $1, $2, $3, ...

if [ $# -lt 2 ]; then
    echo -e "\nSUPPLY MORE PROCESS ARGS!!!\n"
	exit 1
fi

# $* demo
echo "## Loop through args with DOLLAR-STAR ##"
for ARG in $*
do 
	echo $ARG
done
	
#- $@ demo
echo -e "\n## Loop through args with DOLLAR-AT ##"
printf "%s\n" "$@"
	
echo -e "\nfirst parameter value:  $1"
echo "second parameter value: $2"

echo -e "\n# =========================== #"
echo "#            ARRAYS           #"
echo -e "# =========================== #\n"

## Array initialization ##
#- array_name = ( value1 ... valueN )

MY_ARR=($@)

 #- Acces an entry by index: ${array_name[index]}
 echo "1) first array value: ${MY_ARR[0]}"
 echo -e "2) second array value: ${MY_ARR[1]}\n"
 
 #- Access all the variables in one of two ways ${array[@]} or ${array[*]}
 
for i in ${MY_ARR[@]}
do
    echo -e "> $i\n"
done

 #- Determine the array length with $#array[@]
 echo -e "This array has a length of ${#MY_ARR[@]}\n"
 
 #- Use += to add values to array
 echo -e "# Add value 'New_Value' to array #\n"
 
 MY_ARR+=("New_Value")
 echo "This array now has a length of ${#MY_ARR[@]}"
 echo ${MY_ARR[@]}

echo -e "\n# =========================== #"
echo "#          OPPERATORS         #"
echo -e "# =========================== #\n"
 
 #- Basic arithmetic opperations need to be run with the external program expr or awk
 #- opperations take the form `expr # -operator- #` => `expr 1 + 1`
 echo "## Arithmetic ##"
 #- Addition 
 _ADD=`expr 20 + 10`
 echo "20 + 10 = $_ADD"
 
 _SUBTRACT=`expr 20 - 10`
 echo "20 - 10 = $_SUBTRACT"
 
 _MULTIPLY=`expr 20 \* 10`
 echo "20 * 10 = $_MULTIPLY"
 
 _DIVIDE=`expr 20 / 10`
 echo "20 / 10 = $_DIVIDE"
 
 _MODULUS=`expr 20 % 10`
 echo "20 % 10 = $_MODULUS"
 
 ## Relational Operators ##
 
 
echo -e "\nEND"