#from parser import parse, parse_predictions
#from bernoulli_funcs import find_accuracy
#from svm_cross_val_funcs import change_to_binary_predictions

'''
before running this make sure you have created the data using the scripts in the making_cup_images
folder
'''

#this will make the subsets for you
import generate_subsets
import subprocess
import os

c_values= [.001, .01, .1, 1, 5, 10]
best_performance= 0
best_c= 0

for c in c_values:
    proc = subprocess.Popen(["bash", "perform_classification.sh", str(c)], stdout=subprocess.PIPE)
    average_performance= 0
    averaging_count= 0
    out= proc.communicate()[0]
    for line in out.split('\n'):
        if 'Accuracy' in line:
            average_performance += float(line[line.index(':')+2:line.index('%')])
            averaging_count += 1

    average_performance/= averaging_count
    print 'c value: ' + str(c)
    print 'average_performance: ' + str(average_performance)

    if average_performance > best_performance:
        best_performance= average_performance
        best_c= c

print "best c value: " + str(best_c)
print "best performance: " + str(best_performance)

#create a classifier from all of the training data
os.system('../svm_learn -c ' + str(best_c) + ' output/full_training output/best_single_cup_model')

#don't really need any of the below for robot learning
#run after selecting best c value and classifying the test set
#test= parse("./making_cup_images/output/features/data")
#predictions= parse_predictions("output/predictions_for_parta")
#predictions= change_to_binary_predictions(predictions)
#accuracy, false_plus, false_minus = find_accuracy(test, predictions)

#print "accuracy= " + str(accuracy)
#print "false positives= " + str(false_plus)
#print "false negatives= " + str(false_minus)
