#!/bin/sh
export JAVA_HOME=$JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH

BASE="`dirname $0`"
LIB_PATH="$BASE/../lib"
LIB_EXT_PATH="$BASE/../lib_ext"
LOCALCLASSPATH=`echo $LIB_PATH/*.jar | tr ' ' ':'`
export CLASSPATH=$LIB_EXT_PATH/mail.jar:$LIB_EXT_PATH/activation.jar:$LIB_EXT_PATH/j2ee-1.4.jar:$LOCALCLASSPATH

CONSOLE_PATH=${talos_task_loggingRoot}/console

mkdir -p $CONSOLE_PATH

function exit_root () {
    echo
    echo "ERROR! root (the superuser) can't run this script."
    echo
    exit 1
}

if [ `id -u` = 0 ]
then
    exit_root
fi