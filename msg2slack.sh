#!/bin/bash
[[ $1 ]] || { echo "Usage: $0 \"<#channel>\" \"[message]\"" && exit 1; }
chan="$1"
{ [[ $2 ]] && msg="$2"; } || msg=$(cat -)
{ [[ -f token ]] && source token; } || { echo "Token required, try: echo 'api=xxxx-xxxxxxxxx-xxxx' > token" && exit 1; }
file="$1"
[[ $api ]] || { echo "Token not set..exiting" && exit 1; }

curl -F username="msg2slack" -F channel=$chan -F text="$msg" -F token=${api} https://slack.com/api/chat.postMessage
