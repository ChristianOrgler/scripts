#!/bin/bash

function set_airport {
    new_status=$1
    air_name=`networksetup -listnetworkserviceorder | sed -En 's/^\(Hardware Port: (Wi-Fi|AirPort), Device: (en.+)\)$/\2/p'`

    if [ $new_status = "On" ]; then
        /usr/sbin/networksetup -setairportpower $air_name on
    else
        /usr/sbin/networksetup -setairportpower $air_name off
    fi
}

# default status is off
eth_status="Off"

# lets grab the ethernet name to check status
eth_names=`networksetup -listnetworkserviceorder | sed -En 's|^\(Hardware Port: .*(Slot 1\|Ethernet\|LAN).*, Device: (en.+)\)$|\2|p'`

# check current ethernet status
for eth_name in ${eth_names}; do
    if ([ "$eth_name" != "" ] && [ "`ifconfig $eth_name | grep "status: active"`" != "" ]); then
        eth_status="On"
    fi
done

if [ "$eth_status" == "On" ]; then
    set_airport "Off"
else
    set_airport "On"
fi

exit 0