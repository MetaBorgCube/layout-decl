#!/bin/bash
fileid="1_6CDiVsZg1Xnam-HGQLBaQF-QZFtQz42"
filename="archive.tar.gz"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

tar -xzf ${filename}
rm ${filename}
