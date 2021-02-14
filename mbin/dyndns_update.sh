#!/bin/bash

. ~/.private

LAST_RUN_LOG_FILE=last_run.log
UPDATE_LOG_FILE=dns_update.csv
DEFAULT_LOG_DIR=/var/log/dyndns_update
MY_DOMAIN=enigmata.io

if [[ "$1" != "" && -d $1 ]]
then
    LOG_DIR=${1}
elif [[ -d $DEFAULT_LOG_DIR ]]
then
    LOG_DIR=${DEFAULT_LOG_DIR}
else
    LOG_DIR=.
fi
LAST_RUN_LOG=${LOG_DIR}/${LAST_RUN_LOG_FILE}
truncate --size 0 ${LAST_RUN_LOG}

UPDATE_LOG=${LOG_DIR}/${UPDATE_LOG_FILE}
if [[ ! -f $UPDATE_LOG ]]
then
    echo "\"date\",\"new_ip\"" > $UPDATE_LOG
fi

MY_EXTERNAL_IP=`dig +short myip.opendns.com @resolver1.opendns.com`
if [[ $? -ne 0 ]]
then
    echo "ERROR: Could not determine external IP. Error code=$?" >> $LAST_RUN_LOG 
    exit -1
fi

DNS_DOMAIN_IP=`nslookup ${MY_DOMAIN} | grep Address | grep -v "#" | cut -f2 -d" "`
if [[ $? -ne 0 ]]
then
    echo "ERROR: Could not get IP for ${MY_DOMAIN}. Error code=$?" >> $LAST_RUN_LOG 
    exit -1
fi

if [[ $MY_EXTERNAL_IP != $DNS_DOMAIN_IP ]]
then
    echo "UPDATE: Changing DNS IP from $DNS_DOMAIN_IP to $MY_EXTERNAL_IP" >> $LAST_RUN_LOG
    curl "https://dynamicdns.park-your-domain.com/update?host=@&domain=${MY_DOMAIN}&password=${DYNDNS_TOKEN}&ip=${MY_EXTERNAL_IP}"
    NOW=`date +%F:%H-%M-%S` 
    echo "\"${NOW}\",\"${MY_EXTERNAL_IP}\"" >> $UPDATE_LOG
else
    echo "INFO: External IP and $MY_DOMAIN IP are the same: $MY_EXTERNAL_IP = $DNS_DOMAIN_IP" >> $LAST_RUN_LOG
fi

exit 0
