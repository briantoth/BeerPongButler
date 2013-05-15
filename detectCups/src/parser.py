def parse(file_name):
    file = open(file_name)
    train= []
    for line in file:
        train.append(parse_one_line(line))
    file.close()
    return train

def parse_one_line(line):
    current_example= None
    for s in line.split():
        if current_example is None:
            my_class= int(s)

            #transform into simple binary classificaion
            if my_class > 0:
                my_class = 1
            else:
                my_class= -1

            current_example= (my_class, [])
        else:
            word, frequency= [int(t) for t in s.split(":")]
            current_example[1].append((word, frequency))

    return current_example

def parse_predictions(file_name):
    file = open(file_name)
    predictions= []
    for line in file:
        predictions.append(float(line))

    file.close()
    print predictions
    return predictions
