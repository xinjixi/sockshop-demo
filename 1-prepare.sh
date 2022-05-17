#! /bin/bash
set -x

# apiregistryctl service uploadspec v0.0-rev1/catalogue.json -s catalogue --version 0.0 --revision 1 --debug
apiregistryctl service uploadspec v0.0-rev2/catalogue.json -s catalogue --version 0.0 --revision 2 --debug


cp v0.0-rev2/catalogue.json openapi/
git diff

git add openapi/catalogue.json
git commit -m "perfect catalogue api"
git push origin master

# ./trigger-ci-upload.sh v0.0-2
