from math import log

def bernoulli_model(training_data):
    total_plus= 0.0
    total_minus= 0.0
    counts_plus= {}
    counts_minus= {}
    for ex in training_data:
        count_to_use= None
        if ex[0] == 1:
            total_plus += 1
            count_to_use= counts_plus
        else:
            total_minus += 1
            count_to_use= counts_minus

        for tup in ex[1]:
            if tup[0] in count_to_use:
                count_to_use[tup[0]] += tup[1]
            else:
                count_to_use[tup[0]]= tup[1]

    #normalize to appropriate totals
    for k in counts_plus.keys():
        counts_plus[k] /= total_plus

    for k in counts_minus.keys():
        counts_minus[k] /= total_minus

    return (total_plus/len(training_data), total_minus/len(training_data), counts_plus, counts_minus)

def feature_sum(features, model, plus, log_mode):
    counts_to_use= None
    current_sum= 0
    checked_features= {}
    if(plus):
        if log_mode:
            current_sum= log(model[0])
        else:
            current_sum= model[0]

        counts_to_use= model[2]

    else:
        if log_mode:
            current_sum= log(model[1])
        else:
            current_sum= model[1]

        counts_to_use= model[3]

    for key in counts_to_use:
        if key in features:
            checked_features[key] = 1
            p= counts_to_use[key]
        else:
            p= 1-counts_to_use[key]

        if p == 0:
            p= .00001

        if log_mode:
            current_sum += log(p)
        else:
            current_sum *= p

    #factor in features in the example that are not present in the model
    for k in features.keys():
        if k not in checked_features:
            current_sum += log(.00001)

    return current_sum

def bernoulli_decision(example, model):
    features= {}
    #need to convert list to dictionary for efficiency
    for tup in example:
        features[tup[0]] = tup[1]

    plus_sum= feature_sum(features, model, True, True)
    minus_sum= feature_sum(features, model, False, True)
    if plus_sum > minus_sum:
        return 1
    elif plus_sum < minus_sum:
        return -1
    elif model[0] > model[1]:
        return 1
    else:
        return -1

def cost_sensitive_bernoulli_decision(example, model, negative_bonus):
    features= {}
    #need to convert list to dictionary for efficiency
    for tup in example:
        features[tup[0]] = tup[1]

    plus_sum= feature_sum(features, model, True)
    minus_sum= log(negative_bonus) + feature_sum(features, model, False)
    if plus_sum >= minus_sum:
        return 1
    else:
        return -1

def find_accuracy(test_data, classifications):
    true_plus= 0.0
    false_plus= 0.0
    true_minus= 0.0
    false_minus= 0.0

    for i in range(len(test_data)):
        if classifications[i] == 1:
            if test_data[i][0] == 1:
                true_plus += 1
            else:
                false_plus += 1
        else:
            if test_data[i][0] == -1:
                true_minus += 1
            else:
                false_minus += 1

    accuracy= (true_plus+true_minus)/len(test_data)
    return (accuracy, false_plus, false_minus)

def build_classifications(model, test_data):
    classifications= []
    for example in test_data:
        classifications.append(bernoulli_decision(example[1], model))

    return classifications

def build_classifications_cost_sensitive(model, test_data, negative_bonus):
    classifications= []
    for example in test_data:
        classifications.append(\
            cost_sensitive_bernoulli_decision(example[1], model,\
                                                  negative_bonus))

    return classifications

def estimated_error_rate(test, model):
    total_error= 0.0
    for example in test:
        features= {}
        for tup in example[1]:
            features[tup[0]] = tup[1]

        plus_sum= feature_sum(features, model, True, False)
        minus_sum= feature_sum(features, model, False, False)
        if plus_sum > minus_sum:
            total_error += 1 - plus_sum/(plus_sum + minus_sum)
        else:
            total_error += 1 - minus_sum/(plus_sum + minus_sum)

    return total_error / len(test)
