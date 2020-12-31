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

curl "$baseUrl/admin.php?page=site_update&site=$siteId" -c $sessionCookiePath -b $sessionCookiePath -s -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H "Origin: $baseUrl" -H 'DNT: 1' -H 'Connection: keep-alive' -H "Referer: $baseUrl/admin.php?page=site_update&site=$siteId" -H 'Upgrade-Insecure-Requests: 1' --data-raw "sync=files&privacy_level=0&sync_meta=on&simulate=$simulate&subcats-included=1&submit=Submit"
