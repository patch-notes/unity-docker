#!/bin/sh

mkdir -p /root/.local/share/unity3d/Unity
echo "$UNITY_LICENSE" > /root/.local/share/unity3d/Unity/Unity_lic.ulf
/unity/Editor/Unity 
