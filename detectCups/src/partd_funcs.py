import math

def normalize(examples):
    normalized_examples= []
    for ex in examples:
        features= ex[1]
        div= math.sqrt(reduce(lambda x, y: x+y[1]**2, features, 0))
        normalized_features= []
        for feat in features:
            normalized_features.append((feat[0], feat[1]/div))
        normalized_examples.append((ex[0],normalized_features))

    print str(math.sqrt(reduce(lambda x, y: x+y[1]**2, 
				    normalized_examples[0][1], 0)))
    return normalized_examples
