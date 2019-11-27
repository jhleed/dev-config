#!/bin/bash

# TODO : Change to env variables

tir_repo=$TIR_REPOSITORY
til_upload_dir=$UPLOAD_TIR_DIR
til_name='Today I Learned TIL'

DATE=$(date +%F)

echo "tir_repo :" $tir_repo
echo "til_upload_dir :" $til_upload_dir

echo "Unziping.."

unzip $til_upload_dir/*.zip
# rm $til_upload_dir/*.zip

echo "Move to TIL directory.."

# move til directory

# rm -r $tir_repo/*

rm $tir_repo/readme.md
rm -r $tir_repo/Today\ I\ Learned\ TIL/

mv $til_upload_dir/*.md $tir_repo/readme.md
mv $til_upload_dir/Today\ I\ Learned\ TIL/ $tir_repo

echo "Git Repository Push.."

cd $tir_repo

git add .
git commit -m "$DATE"
git push origin master
git pull

echo "Upload Complete!"

echo "Clear resources.."

rm -r $til_upload_dir/*

open https://github.com/jhleed/TIL/tree/master