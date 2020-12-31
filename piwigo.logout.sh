#!/bin/bash

[[ $# < 2 ]] && {
    echo "ERROR $(date -Is) - Need more parameter. Call $0 <piwigoBaseUrl> <sessionCookiePath>"
    exit 1
}

basedir=$(dirname "$0")
baseUrl=$1
sessionCookiePath="$2"

curl \
	-c $sessionCookiePath -b $sessionCookiePath "$baseUrl/?act=logout" -s \
	--compressed \
	-H "Referer: $baseUrl" \

rm "$sessionCookiePath"
