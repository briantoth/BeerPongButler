def parse(file_name):
    file = open(file_name)
    train= []
    for line in file:
        has_class= False
        current_example= None
        for s in line.split():
            if not has_class:
                my_class= int(s)
                current_example= (my_class, [])
                train.append(current_example)
                has_class= True
            else:
                word, frequency= [int(t) for t in s.split(":")]
                current_example[1].append((word, frequency))

    file.close
    return train 


