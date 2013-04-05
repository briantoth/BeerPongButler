from table_seperator import project,norm,rotationMatrix
import numpy as np

point= np.array([1,1,1])
plane= np.array([0,0,0])
normal= np.array([0,0,1])
print project(point,plane,normal)

print norm(np.array([-2, .8, -.444]))

print rotationMatrix(normal)
