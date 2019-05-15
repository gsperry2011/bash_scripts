#!/bin/bash

# The input inventory file(s)
FILES=$@

# Inventory we'll increment as we find systems
DEVELOPMENT=0
PRODUCTION=0
OTHER_ENV=0
LINUX=0
WINDOWS=0
OTHER_OS=0

for F in $FILES
do
    echo "===================="
    echo "File = $F"

    cat $F | while read LINE
    do
	#echo "Line: $LINE"

	# Classify by Environment
	case $LINE in
	    usoh4d*)
		echo "Development: $LINE"
		((DEVELOPMENT++))
		;;
	    usoh4p*)
		echo "Production: $LINE"
		((PRODUCTION++))
		;;
	    *)
		echo "Other: $LINE"
                ((OTHER_ENV++))
		;;
	esac

	# Classify by OS type
	case $LINE in
	    usoh4?l*)
		echo "Linux: $LINE"
		((LINUX++))
		;;
	    usoh4?w*)
		echo "Windows: $LINE"
		((WINDOWS++))
		;;
	    *)
		echo "Other OS: $LINE"
		((OTHER_OS++))
		;;
	esac
    done
done

echo "OS Windows $WINDOWS"
echo "OS Linux $LINUX"
echo "OS Other $OTHER_OS"
echo "Environment Production $PRODUCTION"
echo "Environment Development $DEVELOPMENT"
echo "Environment Other $OTHER_ENV"
