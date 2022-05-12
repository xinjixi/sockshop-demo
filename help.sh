#! /bin/bash
set -x

# host=http://localhost:8081
host=https://devnet-testing.cisco.com
apiregistryctl -H "$host" service list


apiregistryctl -H "$host" spec list
