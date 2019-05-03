function[root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%% Sean McDonough
% This function finds the roots of a inputed function using the false
% position method 

% The user inputs:
% func - the function being evaluted
% xl - the lower guess
% xu - the upper guess
% es - the desired relative error
% maxiter - the number of iterations desired

% The function outputs:
% root - the estimated root location
% fx - the function evaluted at the root location
% ea - the approximate relative error (%)
% iter - how many iterations were performed

% Checks to see if user inputed correct amount of inputs 
    if nargin < 3
        error('Not enough input arguments were inputed');
    elseif nargin < 4
        maxiter = 200;
        es = .000001;
    else
    end
    
% Starting points of the variables
    iter = 0;
    root = 0;
    ea = 1;

% Finds the y value of the bounds
    yl = func(xl);
    yu = func(xu);
        
% Loops the root closer to the exact root until the relative error or the max iterations exceded the inputs maximums   
    while ea > es && maxiter > iter
        previousroot = root;
        root = xu-((yu*(xl-xu))/(yl-yu));
        fx = func(root);
        iter = iter + 1;
        
% Determines which bound the root replaces
        if sign(fx) == sign(yl)
            xl = root;
            yl = fx;
        else
            xu = root;
            yu = fx;
        end
     
% Checks to see if the root is within the bounds
    if root > xu || root < xl
        error('There is no root located within the bounds inputed');
    else
    end
    
% Calculates approximate relative error
        ea = abs((root-previousroot)/root*100);
    end
end