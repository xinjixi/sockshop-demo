#! /bin/bash
set -x

tag=v0.0-default
if [ -n "$1" ]; then
  tag="$1"
fi

git push origin --delete $tag
git tag -d $tag
git tag $tag
git push origin $tag
