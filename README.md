# Update Vultr DDNS

This script will periodically update the A records of a list of domains and subdomains (managed by Vultr's DNS system) with the external IP address of the host machine, emulating a DDNS service.

## Usage

```sh
# The script uses the directory structure of /domains to determine which domains and subdomains should be updated.
# The following structure will create records for subdomain1.domain1.com, subdomain2.domain1.com, domain2.com, subdomain3.domain2.com
mkdir domains
mkdir domains/domain1.com
touch domains/domain1.com/subdomain1
touch domains/domain1.com/subdomain2
mkdir domains/domain2.com
touch domains/domain2.com/@
touch domains/domain2.com/subdomain3

# Required. You can setup your key at https://my.vultr.com/settings/#settingsapi. Pay close attention to which IPs can use the key!
VULTR_API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ

# Optional. A frequence understood by the sleep command (i.e. number followed by s/m/h). Default: 1h
DDNS_UPDATE_FREQUENCY=1h

docker run \
  --env VULTR_API_KEY=$VULTR_API_KEY \
  --env DDNS_UPDATE_FREQUENCY=$DDNS_UPDATE_FREQUENCY \
  --volume $(pwd)/domains:/domains \
  tsfoster/update-vultr-ddns:latest
```
