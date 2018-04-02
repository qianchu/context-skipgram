
# add packages and conda
apt-get update
apt-get install vim
pip install --upgrade tensorflow

#install conda
# file='/home/Anaconda3-5.0.1-Linux-x86_64.sh'
# if echo $PATH | grep -q anaconda3
# then
# 	echo 'conda installed'
# else
#     echo "$0: File '${file}' not found."
# 	cd /home/
# 	curl -O https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
# 	sha256sum Anaconda3-5.0.1-Linux-x86_64.sh
# 	bash ${file}
	
# 	urce ~/.bashrc

# fi


# run jupyter
cd /home/context-embed/
cp /home/jupyter_notebook_config.py /root/.jupyter/
for pid in $(ps -def | grep jupyter | awk '{print $2}'); do kill -9 $pid; done
jupyter notebook --ip '*'  --port=8888 --allow-root &

