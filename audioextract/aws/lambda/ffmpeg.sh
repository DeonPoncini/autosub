#! /bin/sh

wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
tar xvf ffmpeg-release-amd64-static.tar.xz

mkdir -p ffmpeg/bin

cp ffmpeg-*/ffmpeg ffmpeg/bin

pushd ffmpeg
zip -r ../ffmpeg.zip .
popd

# cleanup
rm ffmpeg-release-amd64-static.tar.xz
rm -rf ffmpeg-*/
rm -rf ffmpeg/*
rmdir ffmpeg/

