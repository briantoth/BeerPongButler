% Homework 3 Problem 1f
clc
clear all
% points = [1 4 3 3 2 1;
%           5 2 3 4 1 1;
%           1 1 1 1 1 1];
% y = [1 1 1 1 -1 -1];

%points =[1 4 2 1; 5 2 1 1; 1 1 1 1];
%y = [1 1 -1 -1];
%points = [1 4 2; 5 2 1; 1 1 1];
%y = [1 1 -1];

points = [4 3 2; 2 3 1; 1 1 1]; 
y = [1 1 -1];

%points = [4 2; 2 1; 1 1];
%y = [1 -1];
gamma_opt = (3/4)*sqrt(2);

beta = .99;

a = zeros(1,length(y));

gamma = beta*gamma_opt;

done = false;
iterations = 0;
flag = 1;
while ~done
    
    for i = 1:length(y)      
        
        w = [0; 0; 0];
        for k = 1:length(a)                
            w = w + a(k)*y(k)*points(:,k); 
        end
        
        if y(i)*dot(w,points(:,i))/norm(w(1:2)) <= gamma || flag == 1
            flag = 0;
            a(i) = a(i) + 1;
        end
    end
    iterations = iterations + 1;
    if iterations == 1000
        
        done = true;
    end

end


a/norm(w)
w
