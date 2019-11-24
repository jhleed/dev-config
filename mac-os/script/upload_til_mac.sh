#!/bin/bash

# TODO : Change to env variables

tir_dir=$TIR_REPOSITORY
til_upload_dir=$UPLOAD_TIR_DIR
DATE=$(date +%F)

echo "tir_dir :" $tir_dir
echo "til_upload_dir :" $til_upload_dir

echo "Unziping.."

unzip $til_upload_dir/*.zip

echo "Move to TIL directory.."

# move til directory

rm $til_dir/*.md
rm $til_upload_dir/*.png
rm $til_upload_dir/*.jpeg

mv $til_upload_dir/*.md $tir_dir/readme.md
mv $til_upload_dir/*.png $tir_dir/
mv $til_upload_dir/*.jpeg $tir_dir/


echo "Git Repository Push.."

echo "Git Repository Push.."


cd $tir_dir

git add .
git commit -m "$DATE"
git push origin master
git pull

echo "Upload Complete!"

echo "Clear resources.."

rm $til_upload_dir/*.zip
rm $til_upload_dir/*.png
rm $til_upload_dir/*.jpeg

open https://github.com/jhleed/TIL/tree/master