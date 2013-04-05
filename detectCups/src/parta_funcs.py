from parser import parse
import svmlight


def predict_classification(classifications, example):
    best_value= classifications[0][example]
    best_index= 0
    for classification_index in range(len(classifications)):
        if classifications[classification_index][example] > best_value:
            best_value= classifications[classification_index][example]
            best_index= classification_index

    return best_index+1

def find_multiclass_error(models, test):
    errors= 0
    classifications= []
    for i in range(len(models)):
        classifications.append(svmlight.classify(models[i], test))

    for i in range(len(test)):
        predicted_classification= predict_classification(classifications, i) 
        if predicted_classification != test[i][0]:
            errors= errors+1

    return float(errors)/len(test)

def find_single_class_error(model, test, target_example):
    errors= 0
    test= change_to_binary_examples(test, target_example)
    classification= svmlight.classify(model, test)
    for i in range(len(test)):
        predicted_classification= 0
        if(classification[i] > 0):
            predicted_classification= 1
        else:
            predicted_classification= -1

        if predicted_classification != test[i][0]:
           errors= errors+1

    return float(errors)/len(test)

def change_to_binary_examples(training_data, target_example):
    binary= []
    for i in range(len(training_data)):
        if training_data[i][0] == target_example:
            binary.append((1, training_data[i][1]))
        else:
            binary.append((-1, training_data[i][1]))

    return binary


def find_models(training_data, c_value):
    models= []
    for i in range(1,5):
        train= change_to_binary_examples(training_data, i)
        models.append(svmlight.learn(train, type='classification', C=c_value))

    return models


