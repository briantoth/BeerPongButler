from parser import parse
from partd_funcs import normalize
from partb_funcs import find_multiclass_validate_and_train_error
import stopwatch

t = stopwatch.Timer()

train= parse("../articles.train")
train= normalize(train)
find_multiclass_validate_and_train_error(train)

print "Running Time = " + str(t.elapsed)
