from parte_funcs import multiclass_error_1v1, find_1v1_models
from parser import parse

train= parse("../articles.train")
test= parse("../articles.test")

models= find_1v1_models(train, 2)

print "test error for c=2 soft margin= " + \
        str(multiclass_error_1v1(models, test))
