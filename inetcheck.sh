#! /bin/bash 

# Run loop every 2 seconds
while sleep 2;  
do
	# Searching for 'time=' pattern whithin the ping output
	ptime="$(ping -c1 8.8.8.8 2>/dev/null | sed -n 's/.*time=//p' )"

	if [[ -z "$ptime" ]] ;
	then
		echo "connection is lost"

	else
		# In case ping is too long let's assume connection is lost  
		if [[ "$pingtime" -lt 1000 ]] ; 
			then 
				echo "connection is renewed"
			else
				echo "connection is lost"
		fi;
	fi;
done

