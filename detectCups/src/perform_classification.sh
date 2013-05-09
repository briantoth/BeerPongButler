#!/bin/bash

echo $1

for j in {0..4}
do
  ../svm_learn -c $1 -v 0 output/train$j output/model$1
  ../svm_classify output/validation$j output/model$1 output/predictions$1
done

