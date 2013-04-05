import random
from parser import parse
from parta_funcs import find_multiclass_error, find_models

train= parse("../articles.train")
test= parse("../articles.test")

i= 0

models= find_models(train, .125)

print "test error for c=.125 soft margin= " + \
        str(find_multiclass_error(models, test))
