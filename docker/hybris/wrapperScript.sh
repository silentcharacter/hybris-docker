#!/bin/bash
# Start the 1st process
cd /src/hybris/bin/ext-commerce/solrserver/resources/solr/bin
chmod 777 solr
export SOLR_SSL_ENABLED=true
./solr stop
./solr start -force -p 8983 
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start solr: $status"
  exit $status
fi
echo "solr started: $status"
  
# avalara tomcat
/src/apache-tomcat-8.5.37/bin/startup.sh

/bin/bash

#cd /src/hybris/bin/platform/
#. ./setantenv.sh -D

#echo "*********************************stopping hybris server ******************************** $1"

#if [ "$1" == "clean" ]; then 
#echo "*********************************ant clean all ******************************** $1"
#ant clean all
#else 
#echo "#################################ant all ######################### $1"
#ant  all
#fi

#if [ $? -eq 0 ]; then
#    echo OK
#else
#    echo FAIL
#	exit
#fi

#if [ "$3" == "y" ]; then 
#echo "################################# initializing ################################# $2"
#ant initialize
#fi
#cd /src/hybris/bin/platform/
#if [ "$2" == "y" ]; then 
#echo "################################# debugging ################################# $2"
#./hybrisserver.sh debug 
#else 
#echo "********************************* without debugging *********************************"
#./hybrisserver.sh
#fi


#status=$?
#if [ $status -ne 0 ]; then
#  echo "Failed to start my_first_process: $status"
#  exit $status
#fi

