#!/usr/bin/env bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ "$1" = "--clean" ];then
    rm -rf $SCRIPTPATH/build $SCRIPTPATH/dist $SCRIPTPATH/deadcat.egg-info
elif [ "$1" = "--uninstall" ];then
    pip uninstall deadcat
else
    python $SCRIPTPATH/setup.py bdist_wheel
    pip install $SCRIPTPATH/dist/$(ls $SCRIPTPATH/dist | head -1)
fi
