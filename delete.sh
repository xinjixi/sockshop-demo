#! /bin/bash

set -ex

org="some org name"

# service=bbc
# printf -v payload '{ "organization_id": "xxx", "product_tag": "Book Shop", "name_id": "%s", "title": "demo %s", "description": "%s API", "contact": {} }' "$service" "$service" "$service"
# apiregistryctl -H "$host" service create --data "$payload" --debug || true


# service=abc
# printf -v payload '{ "organization_id": "xxx", "product_tag": "Book Shop", "name_id": "%s", "title": "demo %s", "description": "%s API", "contact": {} }' "$service" "$service" "$service"
# apiregistryctl -H "$host" service create --data "$payload" --debug || true

apiregistryctl -H "$host" service list
apiregistryctl -H "$host" service list | grep "$org"
apiregistryctl -H "$host" service list | grep "$org" | awk '{print $2}'

apiregistryctl -H "$host" service list | grep "$org" | awk '{print $2}' | xargs -I {} apiregistryctl service delete --debug {}

apiregistryctl -H "$host" service list | grep "$org"
