#! /bin/bash 
connlost="Connection is lost"
connok="Connection is renewed"

# Run loop every 2 seconds
while sleep 2;  
do
	# Searching for 'time=' pattern whithin the ping output
	ptime="$(ping -c1 8.8.8.8 2>/dev/null | sed -n 's/.*time=//p' )"

	if [[ -z "$ptime" ]] ;
	then
		# if ping returns 'Network is unreachable'
		echo $connlost

	else
		# In case ping is too long, assume connection is lost  
		if [[ "$pingtime" -lt 1000 ]] ; 
			then 
				echo $connok
			else
				echo $connlost
		fi;
	fi;
done

