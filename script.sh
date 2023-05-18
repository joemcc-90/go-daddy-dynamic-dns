#!/bin/bash

headers="Authorization: sso-key $key:$secret"

result=$(curl -s -X GET -H "$headers" \
 "https://api.godaddy.com/v1/domains/$domain/records/$type/$name")

dnsIp=$(echo $result | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
 echo "dnsIp:" $dnsIp

# Get public ip address there are several websites that can do this.
ret=$(curl -s GET "http://ipinfo.io/json")

currentIp=$(echo $ret | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
 echo "currentIp:" $currentIp

if [ "$dnsIp" != "$currentIp" ];
 then
        echo "IP's are not equal, updating record"
        curl -X PUT "https://api.godaddy.com/v1/domains/$domain/records/$type/$name" \
		-H "accept: application/json" \
		-H "Content-Type: application/json" \
		-H "$headers" \
		-d "[ { \"data\": \"$currentIp\", \"port\": $port, \"priority\": 0, \"protocol\": \"string\", \"service\": \"string\", \"ttl\": $ttl, \"weight\": $weight } ]"  
fi
if [ "$dnsIp" = "$currentIp" ];
 then
      echo "IP's are equal, no update required"
fi
#EOF