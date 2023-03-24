#!/bin/bash

CONTROL_PLANE_URL=https://github.com/eedorenko/kalypso-oci-gitops
CONTROL_PLANE_FOLDER=vm

ansible-pull -o --check --list-hosts -U $CONTROL_PLANE_URL -C dev -d control-plane  > checklog

if cat checklog | grep -q "\"changed\": false"
then
  echo "No changes to apply"
  exit
fi

# itereate over all namespace.yaml files in control-plane sunbfolder and play them
for f in $(find control-plane/$CONTROL_PLANE_FOLDER -name "namespace.yaml")
do
  ansible-playbook -b $f 
done

# itereate over all reconiler.yaml files in control-plane sunbfolder and play them
for f in $(find control-plane/$CONTROL_PLANE_FOLDER -name "reconciler.yaml")
do
  ansible-playbook -b $f 
done

