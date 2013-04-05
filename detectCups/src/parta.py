from parser import parse
from parta_funcs import find_single_class_error, find_multiclass_error, find_models

tst= parse("../articles.test")
trn= parse("../articles.train")
mdls= find_models(trn, 1024)

for i in range(len(mdls)):
    print "training error for class " + str(i+1) +" = " + \
            str(find_single_class_error(mdls[i], trn, i+1)) 

print "multiclass test error= " + str(find_multiclass_error(mdls, tst))
