from parser import parse
from svm_cross_val_funcs import subsets, print_to_svm
import random

trn= parse("making_cup_images/output/features/data")

#need to modify the data so that there are roughly equal numbers of positive and negative examples
positive = []
negative= []
print trn
for ex in trn:
    if ex[0] == -1:
        negative.append(ex)
    else:
        positive.append(ex)

print len(positive)
print len(negative)

random.shuffle(positive)
random.shuffle(negative)

if len(positive) > len(negative):
    positive= positive[:len(negative)]
else:
    negative= negative[:len(positive)]

print len(positive)
print len(negative)

trn= positive+negative

training, validation= subsets(trn, 5)


#used this to split up the training and validation data, and then
#manually ran part2a.sh and part2d.sh on it
print_to_svm(trn, "full_training")
for i in range(len(training)):
    print_to_svm(training[i], "train"+str(i))
    print_to_svm(validation[i], "validation"+str(i))
