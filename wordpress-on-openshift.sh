#!/bin/bash

## Reference https://blog.openshift.com/running-wordpress-easy-way/
## Prereqisite:
### Login OpenShift.


## Install Procedure:
oc new-project wordpress --description="WordPress Demo 展示" --display-name="WordPress Demo 展示"
oc create -f https://raw.githubusercontent.com/holodragon/wordpress-quickstart/master/templates/classic-standalone.json
oc create -f https://raw.githubusercontent.com/holodragon/wordpress-quickstart/master/templates/classic-repository.json
oc create -f https://raw.githubusercontent.com/holodragon/wordpress-quickstart/master/templates/testing-standalone.json
oc create -f https://raw.githubusercontent.com/holodragon/wordpress-quickstart/master/templates/testing-repository.json

oc new-app wordpress-classic-standalone
# oc new-app wordpress-testing-standalone

## Env Info:
echo "### Env Info:"
echo "Login host - http://"$(oc get route my-wordpress-site -o jsonpath="{.spec.host}")

echo "### Back to OpenShift wordpress project, and check secret info for login ###"