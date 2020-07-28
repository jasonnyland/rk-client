#!/bin/bash
url=URL
name=WEBDAV_USERNAME
pass=WEBDAV_PASSWORD
b1=Lrsp8fEfIuGFxWR2s4vj
b2=l58vPPTyeUWe1sxTe3ZN

if [ $# == 3 ]; then
    #set url
	sed -i "s/\($url *= *\).*/\1$1/" docker-compose.yml
	# set new username/password
	sed -i "s/\($name *= *\).*/\1$1/" docker-compose.yml
	sed -i "s/\($pass *= *\).*/\1$2/" docker-compose.yml
	# run script to remove old dockers and re-run compose
	./recompose.sh
	# remove plaintext user data from docker
	sed -i "s/\($name *= *\).*/\1$b1/" docker-compose.yml
	sed -i "s/\($pass *= *\).*/\1$b2/" docker-compose.yml
else
	echo "Incorrect args.  Use \"./initialcfg.sh url user pass\""
fi
	
