
home_path='/home/context-embed/context-skipgram/'
time=$(date -u +"%y-%m-%d-%H-%M")
python3 word2vec_optimized.py \
  --train_data=$home_path'data/text8' \
  --eval_data=$home_path'eval/questions-words.txt' \
  --save_path=$home_path'training_out/' &> $home_path'training_out/'${time} &
