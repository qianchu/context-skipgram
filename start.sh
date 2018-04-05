# add git config name
git config --global user.email "hey_flora@126.com"


# add packages and tensorflow eager in python startup
apt-get update
apt-get install vim
export PYTHONSTARTUP='/home/context-embed/context-skipgram/PYTHONSTARTUP.py'





# run jupyter
cd /home/context-embed/
cp /home/context-embed/context-skipgram/jupyter_notebook_config.py /root/.jupyter/
for pid in $(ps -def | grep jupyter | awk '{print $2}'); do kill -9 $pid; done
export SHELL=/bin/bash
jupyter notebook --ip '*'  --port=8888 --allow-root &

