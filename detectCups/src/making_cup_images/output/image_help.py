import random
import glob
import os

image_files= [x for x in glob.glob('*.png')]
random.shuffle(image_files)
with open('image_file_names', 'w', 1) as f:
    for im in image_files:
        image_name= im[:im.index('_')+3]
        f.write(image_name + '\n')
        os.system("display -resize '500%' " + im)

