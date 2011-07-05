#!/bin/bash

recommender=BiasedMatrixFactorization
k=10

if [ "$1" == "construct" ]; then
    echo Nothing to construct.
elif [ "$1" == "setHyperparameter" ]; then
    if [ "$2" == "0.01" ]; then
        echo --recommender-options=\"regularization=0.01\" > hp.txt
    elif [ "$2" == "0.1" ]; then
        echo --recommender-options=\"regularization=0.025\" > hp.txt
    elif [ "$2" == "1" ]; then
        echo --recommender-options=\"regularization=0.05\" > hp.txt
    elif [ "$2" == "10" ]; then
        echo --recommender-options=\"regularization=0.075\" > hp.txt
    elif [ "$2" == "100" ]; then
        echo --recommender-options=\"regularization=0.1\" > hp.txt
    else
        echo Unknown hyperparameter.
    fi
elif [ "$1" == "learn" ]; then
    xargs --arg-file=hp.txt mono --debug RatingPrediction.exe --training-file=$2 --recommender=$recommender --recommender-options="num_factors=$k bias_reg=0.001 learn_rate=0.05 num_iter=500 bold_driver=true" --save-model=model.txt
    cp $2 training_file
elif [ "$1" == "predict" ]; then
    mono --debug RatingPrediction.exe --training-file=training_file --test-file=$2 --prediction-file=$3 --recommender=$recommender --load-model=model.txt --prediction-line=\"{2}\"
else
    echo Usage: $0 construct\|setHyperparameter\|learn\|predict
fi
