#!/bin/bash

input_file=$1
output_file="${input_file%.mov}.mp4"

echo $1
echo $output_file

ffmpeg -i $input_file -c:v libx264 -c:a aac $output_file
