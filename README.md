# Guide

Download the cli locally and you can try the demo flow locally.
```
./demo.sh
```

v0.0-rev1: raw spec
v0.0-rev2: perfect spec
v0.1-rev1: add some violations against perfect spec
v0.1-rev2: fix all the issues in v0.1-rev1

## Trigger workflow

1. Change the catalogue.json in openapi folder by copying the same files in other version folders. This add some violations.
```
cp v0.1-rev1/catalogue.json openapi/
```
2. Show the diff.
```
git diff
```
3. Commit the change. This will trigger the analyze and diff check.
```
git add openapi/catalogue.json
git commit -m "add delete catalogue api"
git push origin master
```
4. Run the shell script. This will push new git tag to trigger upload. UI will show the result as well.
```
./trigger-ci-upload.sh v0.1-1
```
5. Fix the broken spec by coping the one from v0.1-rev2.
```
cp v0.1-rev2/catalogue.json openapi/
```
6. Show the diff.
```
git diff
```
7. Commit the change. This will trigger the analyze and diff check.
```
git add openapi/catalogue.json
git commit -m "fix catalogue api"
git push origin master
```
8. Run the shell script. This will push new git tag to trigger upload. UI will show the result as well.
```
./trigger-ci-upload.sh v0.1-2
```
9. From the UI, then no violations will be found.

## Useful commands


```
apiregistryctl analyze v0.1-rev1/catalogue.json
apiregistryctl diff v0.1-rev1/catalogue.json -s catalogue --version 0.0 --revision 2 -o text --fail-on-incompatible
apiregistryctl service uploadspec v0.0-rev2/catalogue.json -s catalogue --version 0.0 --revision base
```
