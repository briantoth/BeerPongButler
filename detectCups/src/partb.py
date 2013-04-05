from parser import parse
from partb_funcs import find_multiclass_validate_and_train_error

train= parse("../articles.train")
find_multiclass_validate_and_train_error(train)
