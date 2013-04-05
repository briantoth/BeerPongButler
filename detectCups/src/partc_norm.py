import random
from parser import parse
from parta_funcs import find_multiclass_error, find_models
from partd_funcs import normalize

train= parse("../articles.train")
train = normalize(train)
test= parse("../articles.test")

i= 0

models= find_models(train, 2)

print "test error for c=2 soft margin= " + \
        str(find_multiclass_error(models, test))

