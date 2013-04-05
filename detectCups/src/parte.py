from parser import parse
from parte_funcs import onevone_multiclass_validate_and_train_error 
import stopwatch

t = stopwatch.Timer()

train= parse("../articles.train")
onevone_multiclass_validate_and_train_error(train)

print "Running Time = " + str(t.elapsed)
