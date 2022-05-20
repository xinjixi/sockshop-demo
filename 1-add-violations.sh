#! /bin/bash
set -ex

cp v0.1-rev1/catalogue.json openapi/
# git diff
git --no-pager diff

git add openapi/catalogue.json
git commit -m "add delete catalogue api"
git push

./trigger-ci-upload.sh v0.1-1
