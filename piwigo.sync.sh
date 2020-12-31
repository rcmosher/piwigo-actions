#!/bin/bash

[[ $# < 2 ]] && {
    echo "ERROR $(date -Is) - Need more parameter. Call $0 <piwigoBaseUrl> <sessionCookiePath> [<siteId=1>] [<simulate=0>]"
    exit 1
}

basedir=$(dirname "$0")
baseUrl=$1
sessionCookiePath="$2"
siteId=${3:-'1'} # default to '1' if $3 is not set
simulate=${4:-'0'} # default to '0' don't simulate if $4 not set

curl "$baseUrl/admin.php?page=site_update&site=$siteId" \
	-c $sessionCookiePath -b $sessionCookiePath -s \
	--compressed \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H "Origin: $baseUrl" \
	-H "Referer: $baseUrl/admin.php?page=site_update&site=$siteId" \
	--data-raw "sync=files&privacy_level=0&sync_meta=on&simulate=$simulate&subcats-included=1&submit=Submit"
