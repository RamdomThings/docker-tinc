#!/bin/bash

# using authtentication ?
# Create clone url
if [ -z "${GIT_USERNAME}" ]; then
  GIT_FULL_URL=https://"${GIT_URSERNAME}":"${GIT_PASSWORD}"@"${GIT_URL}"
else
  GIT_FULL_URL=https://"${GIT_URL}"
fi


# clone configuration
cd /var/tmp/
git clone ${GIT_FULL_URL} configuration

# Create dinamic configuration
cd configuration
mv /etc/tinc/${MESH}/hosts /etc/tinc/${MESH}/hosts.$(date +%Y-%m-%d-%T)
cp -a hosts /etc/tinc/${MESH}/
cd /var/tmp
rm -rf configuration
cd /

# Start tinc
/usr/sbin/tincd -D -U nobody -n ${MESH}
