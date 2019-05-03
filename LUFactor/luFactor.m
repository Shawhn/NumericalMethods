function [L,U,P] = luFactor(A)
%% Sean McDonough
% This function LU factors a square matrix using LU factorization
% Input = A square matrix ie) [10,2,-1; -3,-6,2;1,1,5]
% Outputs = L: Lower Triangular Matrix
%           U: Upper Triangular Matrix
%           P: The Pivot Matrix
% Where [P][A]=[L][U] & [A]=[P]^-1[L][U] is true

% Checks Size of Matrix
[m,n] = size(A);
if n~=m
    error('The matrix must be a square matrix.');
end

% Checks Amount of Input Variables
if nargin > 1
    error('Too many input arguments.');
else
end

% Create Starting Matrices Based on the Size
L=eye(n);
U=A;
P=eye(n);

% Finds Where to Pivot each run through
    for I=1:n-1
        Pivot = max(abs(U(I:n,I)));
        for C=I:n
            if abs(U(C,I))== Pivot
                D=C;
                break;
            else
            end
        end
    
% Pivots the highest leading term to the top each run through
    L([I,D],1:I-1) = L([D,I],1:I-1);
    U([I,D],I:n) = U([D,I],I:n);
    
% Keeps track of how the Upper Triangular Matrix pivots
    P([I,D],:) = P([D,I],:);
    
% Forms the Lower Triangular Matrix using the coeffients used to eliminate
        for C=I+1:n
            L(C,I) = U(C,I) / U(I,I);
            
% Forms the Upper Triangular Matrix using elimination
            U(C,I:n) = U(C,I:n) - L(C,I) * U(I,I:n);
            
        end
    end

end