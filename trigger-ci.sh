#! /bin/bash
set -x

tag=v0.1-1

git push origin --delete $tag
git tag -d $tag
git tag $tag
git push origin $tag
