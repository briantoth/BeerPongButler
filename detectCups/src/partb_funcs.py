import random
from parser import parse
from parta_funcs import find_multiclass_error, find_models

def create_validate_and_train_subsets(train):
    random.shuffle(train)

    train_subset= []
    validate_subset= []

    i= 0

    while i < len(train)*.75:
        train_subset.append(train[i])
        i= i+1

    while i < len(train):
        validate_subset.append(train[i])
        i= i+1

    return train_subset, validate_subset

def find_multiclass_validate_and_train_error(train):
    train_subset, validate_subset= create_validate_and_train_subsets(train)
    for c in [.125 * 2**j for j in range(13)]:
        models= find_models(train_subset, c)
        print "for c = " + str(c) + " multi_class validation error= " + \
        str(find_multiclass_error(models, validate_subset))

        print "for c = " + str(c) + " multi_class train error= " + \
        str(find_multiclass_error(models, train_subset))
