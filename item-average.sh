#!/bin/bash

if [ "$1" == "construct" ]; then
    echo Nothing to construct.
elif [ "$1" == "setHyperparameter" ]; then
    echo Not supported.
elif [ "$1" == "learn" ]; then
    mono --debug RatingPrediction.exe --training-file=$2 --recommender=ItemAverage --save-model=model.txt
    cp $2 training_file
elif [ "$1" == "predict" ]; then
    mono --debug RatingPrediction.exe --training-file=training_file --test-file=$2 --prediction-file=$3 --load-model=model.txt --prediction-line="{2}"
else
    echo Usage: $0 construct\|setHyperparameter\|learn\|predict
fi
