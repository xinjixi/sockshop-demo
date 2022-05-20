#! /bin/bash
set -x

cp v0.1-rev2/catalogue.json openapi/
git diff

git add openapi/catalogue.json
git commit -m "fix catalogue api"
git push origin master

./trigger-ci-upload.sh v0.1-2
