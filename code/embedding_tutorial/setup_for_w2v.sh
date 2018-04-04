
#!/bin/bash

#download data
data='text8'
eval_data='questions-words.txt'
filepath="/home/context-embed/context-skipgram/data/"
file_eval_path="/home/context-embed/context-skipgram/eval/"
file=$filepath$data
file_eval=$file_eval_path$eval_data

if [ ! -f "$file" ]
then
        cd ${filepath}
        zipfile=${file}'.zip'
	curl http://mattmahoney.net/dc/text8.zip > $zipfile
	unzip $zipfile
fi

if [ ! -f "$file_eval" ]
then
        cd $file_eval_path 
	curl https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/word2vec/source-archive.zip > source-archive.zip
	unzip -p source-archive.zip  word2vec/trunk/questions-words.txt > $file_eval
	rm $zipfile source-archive.zip
fi

cd /home/context-embed/context-skipgram/code/embedding_tutorial/
TF_CFLAGS=( $(python3 -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))') )
TF_LFLAGS=( $(python3 -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))') )
g++ -std=c++11 -shared word2vec_ops.cc word2vec_kernels.cc -o word2vec_ops.so -fPIC ${TF_CFLAGS[@]} ${TF_LFLAGS[@]} -O2 -D_GLIBCXX_USE_CXX11_ABI=0
