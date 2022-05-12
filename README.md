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

* Delete all the tags to avoid conflicts
```
git tag -l | xargs -n 1 git push --delete origin
git tag | xargs git tag -d
Or just remove some specfic one:
git push origin --delete v0.1-1
```
* Trigger workflow bug tag
```
// version 0.1 revision 1
git tag v0.1-1
git push --tags
```
