#!/bin/sh -vx

targetArch=x86_64

if [ -n "$GITHUB_TOKEN" ]; then
  cd generated/objects/haiku/$targetArch/packaging/repositories/Haiku && \
  git init && \
  git add . && \
  git commit -c user.name="Travis CI" -c user.email="github@travis-ci.org" -m "Deploy to GitHub Pages" && \
  git push --force "https://$GITHUB_TOKEN@github.com/korli/haiku.git" master:gh-pages
fi
