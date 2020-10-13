#!/bin/bash
function run_curl {
  curl \
  --insecure \
  --user-agent "AnyConnect Windows $ver" \
  --header "X-Transcend-Version: 1" \
  --header "X-Aggregate-Auth: 1" \
  --header "X-AnyConnect-Platform: $plat" \
  --cookie "sdesktop=$token" \
  "$@"
}

set -e

host={{ vpn_server }}
plat=win
ver=4.8.00175
token=$CSD_TOKEN

###
# Here goes the list of parameters which should be sent back to the server.
# By default, only the endpoint.policy.location parameter is required.
###
# Get the value of the <policy_location> on Windows from the cscan.log file
# OR
# get it from the policy file:
# wget -O - -q https://vpn.company.com/CACHE/sdesktop/data.xml | grep 'location name='
###
run_curl --data-ascii @- "$host/+CSCOE+/sdesktop/scan.xml?reusebrowser=1" <<-END
endpoint.policy.location="Default";
END

exit 0
