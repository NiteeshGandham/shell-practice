#!/bin/bash
#conditions demonstration in shell scripting
#!/bin/bash

echo "Please enter a number"
read num

# -gt -> greater than
# -lt -> less than
# -eq -> equal
# -ne -> not equal

if [ $num -gt 20 ]; then
	echo "$num is greater than 20"
elif [ $num -eq 20 ]; then
	echo "$num is equal to 20"
else	
	echo "$num is less than 20"
fi
