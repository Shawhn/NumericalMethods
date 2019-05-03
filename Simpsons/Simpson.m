function [I] = Simpson(x,y)
%% Sean McDonough
% This function finds the integral when given tabular data using the 1/3
% Simpson Rule of the first segments and all of them if the length of x and
% y are odd and the Trapezoidal Rule of the last segment only when the 
% number of x and y inputs are even.
% Inputs:
% X = X-values in vector form
% Y = Y-values in vector form
% Outputs:
% I = Estimated Integral

% Checks to make sure there are 2 Inputs
if nargin ~= 2
    error('Must input 2 variables');
end

% Checks to makes sure the lengths are consistent
if length(x) ~= length(y)
    error('Vectors X and Y must be the same length');
end

% Checks to make sure length of the vectors has length greater than one
if length(x) <= 1
    error('Vector must have a length greater than one');
end

% Checks to make sure the spacing of the x-values are the consistent
prevspacing = x(2) - x(1);
for n = 1:(length(x)-1)
    spacing = x(n+1) - x(n);
    if abs(spacing - prevspacing) > abs(eps)%Subtractive Cancellation Check
        error('Spacing must be consistent in the X vector');
    end
    prevspacing = spacing;
end


% Sums the integral using 1/3 Simpson Rule through every iteration till it
% reaches the last odd term
I1 = 0;
for i = 1:(floor((length(x)-1)/2))
    I1 = I1 + (x(2*i+1)-x(2*i-1))*(y(2*i-1) + 4*y(2*i) + y(2*i+1))/6;
end

% If the number of x values is even than use Trapezoidal Rule for the last
% segment
I2 = 0;
if rem(length(x),2) == 0
    I2 = (length(x)-(length(x)-1))*(y(length(y))+ y(length(y)-1))/2;
    fprintf('The Trapeziodal Rule was used for the last segment! ');
end

% Sums the 1/3 Simpson Rule & Trapeziodal Rule to find the total Integral
I = I1 + I2;

end
