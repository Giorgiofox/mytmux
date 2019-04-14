ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# function to enumerate all active ip address with no loopback interface

# as usual it may be improved in the future


#to test ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2
function get_ip_wlan() {
         ip="$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 | tr  '\n' ' ')" 
#old     ip="$(ifconfig "en0" | grep broadcast | awk '{print $2}' | tail -n1)"
#old2    ip2="$(ifconfig "en9" | grep broadcast | awk '{print $2}' | tail -n1)


# rememeber to add an enumerate functions  


}


function get_ip_eth() {
    ip="$(ifconfig "en9" | grep ether | awk '{print $2}')"
    #ip="$(ifconfig "en9" | grep broadcast | awk '{print $2}' | tail -n1)    
if [[ $ip != *"."* ]]; then
        ip="n.c."
    fi
}

function print_ip() {
    get_ip_wlan
    if [ ! -z "$ip" ]; then
        echo "$ip"
        exit
    else
        get_ip_eth
        if [ ! -z "$ip" ]; then
            echo "$ip"
#to print two variables use "$var1$var2"
        fi
        exit
    fi

    echo "nc"
}

main() {
  print_ip
}

main
