#!/bin/bash

. ${talos_task_deployhome}/bin/base_fun.sh
DEBUGPORT=`expr 8089`  
TASK_NAME="daemonAO" 
NODE_NAME="daemonAO"
OUTPUT_FILE=$CONSOLE_PATH/daemonAO.log 
JAVA_OPTION="-DtaskName=$TASK_NAME -Dnode=$NODE_NAME -Xms256m -Xmx512m "
DEBUG_OPTION=" -Xdebug -Xrunjdwp:transport=dt_socket,address=$DEBUGPORT,server=y,suspend=y"
ENCODE_OPTS="-Dapplication.codeset=GBK -Ddatabase.codeset=ISO-8859-1 -Djox.xml.encodinged=true" 

if [ "$1" = "start" ] ; then
  if ! ps -ef |grep 'java' |grep "$TASK_NAME"
  then
        echo "`date`:run --------------------------------" >> $OUTPUT_FILE
    java $JAVA_OPTION -cp $CLASSPATH $ENCODE_OPTS com.alibaba.china.talos.daemon.RunClient daemonAO  1>>$OUTPUT_FILE 2>>$OUTPUT_FILE
    echo "task has been started!"
      else
    echo "the task is alreay running !!"
  fi 
elif [ "$1" = "debug" ] ; then
    echo "`date`:debug --------------------------------" >> $OUTPUT_FILE 
    java $JAVA_OPTION $DEBUG_OPTION -cp $CLASSPATH $ENCODE_OPTS com.alibaba.china.talos.daemon.RunClient daemonAO  1>>$OUTPUT_FILE 2>>$OUTPUT_FILE
    echo "task has been started!"
else
  echo "usage: $0 [start|debug]"
fi 