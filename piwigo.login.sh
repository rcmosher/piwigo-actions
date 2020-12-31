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
curl "$baseUrl" -c $sessionCookiePath -b $sessionCookiePath -s -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1'

# Login - note if you view the returned contents it may appear as though your're not logged in.
curl "$baseUrl/identification.php" -c $sessionCookiePath -b $sessionCookiePath -s -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H "Origin: $baseUrl" -H 'DNT: 1' -H 'Connection: keep-alive' -H "Referer: $baseUrl" -H 'Upgrade-Insecure-Requests: 1' --data-urlencode "username=$username" --data-urlencode "password=$password" --data-raw "redirect=%252F&login=Submit"
