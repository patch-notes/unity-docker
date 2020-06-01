#!/bin/sh

Xvfb&
export DISPLAY=:0
/unity/Editor/Unity "$@" 
