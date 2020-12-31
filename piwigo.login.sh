#!/bin/bash

[[ $# < 4 ]] && {
    echo "ERROR $(date -Is) - Need more parameter. Call $0 <piwigoBaseUrl> <username> <password> <sessionCookiePath>"
    exit 1
}

basedir=$(dirname "$0")
baseUrl=$1
username=$2
password=$3
sessionCookiePath="$4"

# Access the page to generate cookie used with login
curl "$baseUrl" \
	-c $sessionCookiePath -b $sessionCookiePath -s \
	--compressed

# Login - note if you view the returned contents it may appear as though your're not logged in.
curl "$baseUrl/identification.php" \
	-c $sessionCookiePath -b $sessionCookiePath -s \
	--compressed \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H "Origin: $baseUrl" \
	-H "Referer: $baseUrl" \
	--data-urlencode "username=$username" \
	--data-urlencode "password=$password" \
	--data-raw "redirect=%252F&login=Submit"
