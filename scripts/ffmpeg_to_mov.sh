#!/bin/bash

input_file=$1
output_file="${input_file%.mp4}.mov"

ffmpeg -i $input_file -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a alac $output_file
