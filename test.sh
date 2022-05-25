#! /bin/bash
set -x

# If demo/test in other branch (like demo) other master
# git push origin --delete demo
# git branch -d demo
# git checkout -b demo
# git branch -u origin/demo

# host=http://localhost:8081
host=https://devnet-testing.cisco.com
# TODO: cart or carts
services=( "cart" "catalogue" "payment" "user" "order")

echo "## Prepare services"
for service in ${services[*]}; do

  echo delete "$service"
  apiregistryctl service delete "$service" --debug || true
  echo create "$service"

  printf -v payload '{ "organization_id": "DevNet", "product_tag": "Sock Shop", "name_id": "%s", "title": "%s demo", "description": "%s API for demo a microservice communication in sockshop", "contact": {"name": "Engineering Team", "email": "engineering@merchandiseshop.com", "url": "https://testing-developer.cisco.com/api-registry/reports?service=%s"}, "analyzers_configs": {"drift": {"service_name_id": "%s.sock-shop"}} }' "$service" "$service" "$service" "$service" "$service"
  apiregistryctl -H "$host" service create --data "$payload" || true
done
apiregistryctl -H "$host" service list

echo "## Upload the v0.0-rev1 specs which are the base raw specs"
for service in ${services[*]}; do
  echo updateload spec for "$service"
  apiregistryctl -H "$host" service uploadspec v0.0-rev1/"$service".json -s "$service" --version v0.0 --revision 1
done

echo "## Upload the v0.0-rev2 specs which are the perfect specs"
for service in ${services[*]}; do
  echo updateload spec for "$service"
  apiregistryctl -H "$host" service uploadspec v0.0-rev2/"$service".json -s "$service" --version v0.0 --revision 2
done
echo "## Finished prepare works"


echo "The following ones will be done through UI or git command trigger CI"

# echo "## Analyze v0.0-rev1 catalogue spec which is the raw spec"
# apiregistryctl -H "$host" analyze v0.0-rev1/catalogue.json

# echo "## Analyze v0.0-rev2 catalogue spec which is the perfect spec fixed all the issues"
# apiregistryctl -H "$host" analyze v0.0-rev2/catalogue.json

# echo "## The following should be part of pipeline, copy the content to openapi folder, commit and push tag will trigger CI"
# echo "## Analyze v0.1-rev1 catalogue spec which add serveral violations like respose code, inclusive language, etc"
# apiregistryctl -H "$host" analyze v0.1-rev1/catalogue.json

# echo "## Diff v0.1-rev1 catalogue spec against v0.0-rev2 to show the break change"
# # apiregistryctl -H "$host" diff v0.1-rev1/catalogue.json -s catalogue --latest -o text
# apiregistryctl -H "$host" diff v0.1-rev1/catalogue.json -s catalogue --version 0.0 --revision 2 -o text

# echo "## Upload v0.1-rev1 of catalogue"
# apiregistryctl -H "$host" service uploadspec v0.1-rev1/catalogue.json -s catalogue --version 0.1 --revision 1
# echo "## Pipeline should finish here"

# echo "## Fix all the issue and rerun pipeline"
# echo "## Analyze v0.1-rev2 catalogue spec which fixed all the issues of v0.1-rev1"
# apiregistryctl -H "$host" analyze v0.1-rev2/catalogue.json

# echo "## Diff v0.1-rev1 catalogue spec against v0.0-rev2 to show the break change"
# # apiregistryctl -H "$host" diff v0.1-rev2/catalogue.json -s catalogue --latest -o text
# apiregistryctl -H "$host" diff v0.1-rev2/catalogue.json -s catalogue --version 0.1 --revision 1 -o text

# echo "## Upload v0.1-rev2 of catalogue which fixed everything"
# apiregistryctl -H "$host" service uploadspec v0.1-rev2/catalogue.json -s catalogue --version 0.1 --revision 2
# echo "## Final pipeline should finish here"
