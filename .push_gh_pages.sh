#!/bin/bash

rm -rf out || exit 0;
mkdir out;

GH_REPO="@github.com/stephlocke/ezknitrTest.git"

FULL_REPO="https://$GH_TOKEN$GH_REPO"

R CMD BATCH 'rendercheck.R'

cp rendercheck.Rout out
cp ~/ezknitrTest/out/* out
cd out
ls -l

git init
git config user.name "stephs-travis"
git config user.email "travis"
git add .
git commit -m "deployed to github pages"
git push --force --quiet $FULL_REPO master:gh-pages
