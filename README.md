# Guide

## Action Required

1. Download the latest cli from the our internal github repo per your OS. Checkout to develop branch. If you use Mac, you can get your binary from cli/bin/darwin/amd64.
2. Copy the binary to your system PATH, and make it executable. For example:
```
cp apiregistryctl /usr/local/bin
chmod +x /usr/local/bin/apiregistryctl
```
3. Clone this repo or fork this repo, make sure you have write access to it. If you forked this repo, you need to enable github actions by going to that tab by yourself.

## Demo

You can simply follow the below steps to demo in staging without viewing other parts of the document.
```
0-prepare.sh
1-add-violations.sh
2-push-tag-v0.1-1.sh
3-fix-violations.sh
4-push-tag-v0.1-2.sh
```

## folders

```
v0.0-rev1: raw spec
v0.0-rev2: perfect spec
v0.1-rev1: add some violations against perfect spec
v0.1-rev2: fix all the issues in v0.1-rev1
```

## workflow explaination

0. Prepare catalogue service(delete and recreate), upload raw spec v0.0-rev1 and perfect spec v0.0-rev2. If you use other env, you need to change the host of the script.
```
./0-prepare.sh
```
1. Change the catalogue.json in openapi folder by copying the same files in other version folders. This add some violations. Commit the change. This will trigger the analyze and diff check.
```
./1-add-violations.sh
```
    Go the github workflow to view the CI result.
2. Push new git tag to trigger upload spec to server.
```
./2-push-tag-v0.1-1.sh
```
    Go the github workflow to view the CI result.
    Then go to UI to view the uploaded version.
3. Fix the broken spec and commit change.
```
./3-fix-violations.sh
```
    Go the github workflow to view the CI result.
4. Push new git tag to trigger upload spec to server.
```
./4-push-tag-v0.1-2.sh
```
    Go the github workflow to view the CI result.
    Then go to UI to view the uploaded version.

## Useful commands


```
apiregistryctl analyze v0.1-rev1/catalogue.json
apiregistryctl diff v0.1-rev1/catalogue.json -s catalogue --version 0.0 --revision 2 -o text --fail-on-incompatible
apiregistryctl service uploadspec v0.0-rev2/catalogue.json -s catalogue --version 0.0 --revision base
```
