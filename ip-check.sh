#! /bin/bash

curl -s https://ipv4.ipleak.net/json/ | jq -r '.country_code | @text'

