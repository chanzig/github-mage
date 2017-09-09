#!/bin/bash
# This is the automated release script

# guard against stupid
if [ -z "$1" ]; then
   echo "You must specify a new version level: [patch, minor, major]";
   exit 1;
fi

npm install
npm run build

git checkout gh-pages
mkdir backup
mv * backup/
mv backup/.gitignore backup/readme.md backup/node_modules backup/dist/* .
rm -rf backup

git add .
git commit -m "new version $1"
git push
