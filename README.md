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

* Change the catalogue.json in openapi folder by copying the same files in other version folders.
* Commit the change.
* Change the tag in ./trigger-ci.sh, like v0.1-1, v0.1-2
* Run the shell script
```
./trigger-ci.sh
```

## Useful commands


```
apiregistryctl diff v0.1-rev1/catalogue.json -s catalogue --version 0.0 --revision 2 -o text
```
