#!/bin/bash

OUT_FILE="out.txt"
> $OUT_FILE

for file in /home/namnguyen/ai/data/*.wav; do
    echo "Processing $file"
    echo "Processing $file" >> $OUT_FILE
    python decode.py \
        --model_checkpoint chunkformer-large-vie \
        --long_form_audio $file \
        --total_batch_duration 14400 \
        --left_context_size 128  \
        --right_context_size 128 >> $OUT_FILE
    echo "" >> $OUT_FILE
done

