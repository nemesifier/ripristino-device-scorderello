#!/bin/bash

IPV4_HOST='10.40.0.130'
IPV6_LINKLOCAL='fe80::227:22ff:fe16:8b12%eth1'
USERNAME='ubnt'
PASSWORD='ubnt'
CONF='/path/to/system.cfg'
TMP_FILE='/tmp/ping_ensure_config'
PING_COUNT=3

/bin/ping -c $PING_COUNT $IPV4_HOST > $TMP_FILE

UNREACHABLE_COUNT=$(grep -o "Unreachable" $TMP_FILE | wc -w)

if [ "$UNREACHABLE_COUNT" = "$PING_COUNT" ]; then
    echo "reconfiguring device"
    # erase ssh known hosts to avoid strict key checking errors (redundant but just in case!)
    echo "" > ~/.ssh/known_hosts
    # upload config
    sshpass -p $PASSWORD scp -o StrictHostKeyChecking=no $CONF $USERNAME@\[$IPV6_LINKLOCAL\]:/tmp/system.cfg
    # connect, apply config, reboot and exit
    sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -l $USERNAME $IPV6_LINKLOCAL <<EOF
        save
        reboot && exit
EOF
else
    echo "everything ok"
fi

rm -f $TMP_FILE
