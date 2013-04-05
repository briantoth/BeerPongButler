% Homework 3 Problem 1 Part A
clc
clear all
points = [1 4 3 3 2 1;
          5 2 3 4 1 1;
          1 1 1 1 1 1];
y = [1 1 1 1 -1 -1];
   
%Part A

w =[0; 0; 0];
k = 0;
done = false;


while ~done
    thisLoop = 0;
    for i = 1:6
        if y(i)*dot(w,points(:,i)) <= 0
           w = w + y(i)*points(:,i);
           k=k+1;
           thisLoop = thisLoop +1;
        end
    end
    
    if thisLoop == 0
        done = true;
    end
    
end

w

x_pos = [1 3 3 4];
y_pos = [5 4 3 2];
x_neg = [1 2];
y_neg = [1 1];
hold on
scatter(x_pos,y_pos,'r')
scatter(x_neg,y_neg,'b')
refline(-w(1)/w(2),-w(3)/w(2))

axis([0 6 0 6])
hold off