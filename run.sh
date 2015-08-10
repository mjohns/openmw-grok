#!/bin/sh
service tomcat7 start

# link mounted source directory to opengrok
ln -s /openmwsrc $OPENGROK_INSTANCE_BASE/src

# first-time index
echo "** Running first-time indexing"
cd /opengrok/bin
./OpenGrok index
echo "** Done indexing"

while [ 1 ]
do
	sleep 2h

	cd /openmwsrc/master/openmw
        git pull https://github.com/OpenMW/openmw.git

	cd /opengrok/bin
  ./OpenGrok index
done
