#!/bin/bash

# TODO : Change to env variables

til_repo=$til_repoSITORY
til_upload_dir=$UPLOAD_TIR_DIR
til_name='Today I Learned TIL'

DATE=$(date +%F)

echo "til_repo :" $til_repo
echo "til_upload_dir :" $til_upload_dir

echo "Unziping.."

unzip $til_upload_dir/*.zip
# rm $til_upload_dir/*.zip

echo "Move to TIL directory.."

# move til directory

# rm -r $til_repo/*

rm $til_repo/readme.md
rm -r $til_repo/Today\ I\ Learned\ TIL/

mv $til_upload_dir/*.md $til_repo/readme.md
mv $til_upload_dir/Today\ I\ Learned\ TIL/ $til_repo

echo "Git Repository Push.."

cd $til_repo

git add .
git commit -m "$DATE"
git push origin master
git pull

echo "Upload Complete!"

echo "Clear resources.."

rm -r $til_upload_dir/*

open https://github.com/jhleed/TIL/tree/master