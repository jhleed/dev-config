#!/bin/bash

til_repo="/c/workspace/TIL"
til_upload_dir="/c/workspace/dev-config/resource/til"
DATE=$(date +%F)

echo "til_repo :" $til_repo
echo "til_upload_dir :" $til_upload_dir

echo "Unziping.."

cd $til_upload_dir

unzip $til_upload_dir/*.zip

echo "Init TIL Repository.."

rm $til_repo/*.md 
rm -r $til_repo/Today\ I\ Learned\ TIL/

echo "Move to TIL directory.."

# move til directory
mv $til_upload_dir/*.md $til_repo/readme.md
mv $til_upload_dir/Today\ I\ Learned\ TIL/ $til_repo/



echo "Git Repository Push.."

cd $til_repo

git pull
git rebase origin master
git add .
git commit -m "$DATE"
git push origin master

# clear 
echo "Clear Til upload dir"

rm $til_upload_dir/*.zip

echo "Complete!"

start https://github.com/jhleed/TIL/tree/master