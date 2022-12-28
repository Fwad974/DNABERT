mkdir out
pip install -r requirements.txt
git clone https://github.com/jerryji1993/DNABERT
python -m pip install --editable DNABERT/.
python data_pre.py
python ./run_pretrain.py \
    --output_dir=./out/ \
    --model_type=dna \
    --tokenizer_name=dna6 \
    --config_name=./config.json \
    --do_train \
    --train_data_file=./train.txt \
    --do_eval \
    --eval_data_file=./test.txt \
    --mlm \
    --gradient_accumulation_steps 25 \
    --per_gpu_train_batch_size 32 \
    --per_gpu_eval_batch_size 32 \
    --save_steps 1 \
    --save_total_limit 20 \
    --max_steps 11000 \
    --evaluate_during_training \
    --logging_steps 500 \
    --line_by_line \
    --learning_rate 4e-4 \
    --block_size 512 \
    --adam_epsilon 1e-6 \
    --weight_decay 0.01 \
    --beta1 0.9 \
    --beta2 0.98 \
    --mlm_probability 0.025 \
    --warmup_steps 1000 \
    --overwrite_output_dir \
    --n_process 12
