# tistory blog upload script


dir_upload_blog=$DIR_BLOG

echo "dir_blog : " $dir_upload_blog

echo "uploading .."

cd $dir_upload_blog
unzip $dir_upload_blog/*.zip

markdown-tistory write


echo "clear all resources"

rm $dir_upload_blog/*.zip
rm $dir_upload_blog/*.md 
rm $dir_upload_blog/*.png
rm $dir_upload_blog/*.jpeg

