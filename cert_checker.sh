#!/bin/bash

#Enter your domains which you check.
domains=( denisthiessen.de example.com )

for domain in "${domains[@]}"
do
	echo "$domain"
	openssl s_client -servername $domain -connect $domain:443 </dev/null 2>/dev/null | openssl x509 -enddate -noout | awk -F= '/^notAfter/ { print "Expires on: " $2 "\n"; exit }'
done