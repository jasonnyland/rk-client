#!/bin/bash
url=URL
srv=server_name
name=WEBDAV_USERNAME
pass=WEBDAV_PASSWORD
b2=Lrsp8fEfIuGFxWR2s4vj
b3=l58vPPTyeUWe1sxTe3ZN

if [ $# == 3 ]; then
    #set url
	sed -i "s/\($url *= *\).*/\1$1/" docker-compose.yml
	sed -i "s/\($srv *= *\).*/\1$1/" default
	# set new username/password
	sed -i "s/\($name *= *\).*/\1$2/" docker-compose.yml
	sed -i "s/\($pass *= *\).*/\1$3/" docker-compose.yml
	# run compose
	sudo docker-compose up -d
	# remove plaintext user data from dockerfile
	sed -i "s/\($name *= *\).*/\1$b2/" docker-compose.yml
	sed -i "s/\($pass *= *\).*/\1$b3/" docker-compose.yml
else
	echo "Incorrect args.  Use \"./firstrun.sh url user pass\""
fi
	
