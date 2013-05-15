import svmlight
import random
from bernoulli_funcs import find_accuracy

def subsets(train, folds):
    random.shuffle(train)

    train_sets= []
    validate_sets= []
    chunk_size= len(train) / folds
    chunks= [train[i:i+chunk_size] for i in range(0, len(train), chunk_size)]

    for i in range(len(chunks)):
        validate_sets.append(chunks[i])
        temp= [];
        for j in range(len(chunks)):
            if i != j:
                temp+= chunks[j]

        train_sets.append(temp)

    return train_sets, validate_sets

def five_fold_validation(training_sets, validation_sets, c_value):
    total_accuracy= 0.0
    for i in range(len(training_sets)):

        model= svmlight.learn(training_sets[i], type='classification', C=c_value)
        classifications= svmlight.classify(model, validation_sets[i])
        predictions= change_to_binary_predictions(classifications)
        accuracy= find_accuracy(validation_sets[i], predictions)
        total_accuracy += accuracy[0]

    return total_accuracy/len(training_sets)

def print_to_svm(svm_data, file_name):
    out= open("output/"+file_name, "w")
    for example in svm_data:
        line= str(example[0])
        for tup in example[1]:
            line += " " + str(tup[0])+":"+str(tup[1])

        out.write(line+"\n")

    out.close()

def change_to_binary_predictions(predictions):
    binary= []
    for prediction in predictions:
        if prediction > 0:
            binary.append(1)
        else:
            binary.append(0)

    return binary
