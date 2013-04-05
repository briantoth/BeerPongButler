import svmlight
import random
from partd_funcs import normalize
from partb_funcs import create_validate_and_train_subsets

def make_1v1_examples(training_data, positive_example, negative_example):
    onevone= []
    for example in training_data:
        if example[0] == positive_example:
            onevone.append((1, example[1]))
        elif example[0] == negative_example:
            onevone.append((-1, example[1]))

    return onevone

def find_1v1_models(training_data, c_value):
    models= {}
    for i in range(1,5):
        for j in range(i+1,5):
            train= make_1v1_examples(training_data, i, j)
            models[(i,j)]= \
            svmlight.learn(train, type='classification', C=c_value)

    return models

def predict_classification_1v1(classifications, i):
    votes= {}
    for pair in classifications.keys():
        if classifications[pair][i] > 0:
            if pair[0] in votes:
                votes[pair[0]]= votes[pair[0]] + 1
            else:
                votes[pair[0]]= 1
        else:
            if pair[1] in votes:
                votes[pair[1]]= votes[pair[1]] + 1
            else:
                votes[pair[1]]= 1

    max_vote_num = max(votes.values())

    highest_votes= {}

    for class_num in votes.keys():
        if votes[class_num] == max_vote_num:
            highest_votes[class_num] = 1

    for vote_weight in highest_votes.values():
        vote_weight= float(vote_weight)/len(highest_votes)

    return highest_votes

def multiclass_error_1v1(models, test):
    errors= 0
    classifications= {}
    for pair in models.keys():
        classifications[pair]=(svmlight.classify(models[pair], test))

    for i in range(len(test)):
        votes= predict_classification_1v1(classifications, i)
        for classNum in range(1,5):
            if classNum in votes and test[i][0] != classNum:
                errors= errors + votes[classNum]

    return float(errors)/len(test)

def onevone_multiclass_validate_and_train_error(train):
    train= normalize(train)
    train_subset, validate_subset= create_validate_and_train_subsets(train)
    for c in [.125 * 2**j for j in range(13)]:
        models= find_1v1_models(train_subset, c)
        print "for c = " + str(c) + " multi_class validation error= " + \
                str(multiclass_error_1v1(models, validate_subset))

        print "for c = " + str(c) + " multi_class train error= " + \
                str(multiclass_error_1v1(models, train_subset))
