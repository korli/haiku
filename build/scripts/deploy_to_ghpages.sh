#!/bin/sh -vx

targetArch=x86_64

if [ -n "$GITHUB_TOKEN" ]; then
  cd generated/objects/haiku/$targetArch/packaging/repositories/Haiku && \
  git init && \
  git config --global user.name "Travis CI" \
  git config --global user.email "github@travis-ci.org" \
  git add . && \
  git commit -m "Deploy to GitHub Pages" && \
  git push --force "https://$GITHUB_TOKEN@github.com/korli/haiku.git" master:gh-pages
fi
