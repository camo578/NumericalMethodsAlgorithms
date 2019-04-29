function [root,fx, ea,iter] = falsePosition(func,xl,xu,es,maxiter);
%Cameron McCormick
%Mech 105
%False Position: Using the false position method in order to approximate
%the root of a function
% Inputs
%func- function getting evaluated
%xl - lower guess
%xu - upper guess
% es - stopping criteria for percent relative error
%maxiter - the maximum number of iterations to be performed

%Outputs
%root - estimated root location
%fx - the function evaluated at the root equation
%ea - approximate relative error
%iter - number of iterations performed

%test function
%test= @(x) ((0.55*25*9.81)/(cos(x)+0.55*sin(x))-150)


format long
 if nargin < 3
     error('Must input func, xl, and xu')
 end
 if nargin == 3
     es=0.0001;
     maxiter=200;
 elseif nargin == 4
     maxiter = 200; 
 end
%Set starting values to use for while loop 
ea=1;
iter=1;
oldxr=0;
f=func;
fxu=f(xu);
fxl=f(xl);
%Check to see if the endpoints can be used for false position
if sign(fxl)==sign(fxu)
    error('Choose different guess endpoints')
end
%Set while loop for stopping criteria
while ea>es && iter<maxiter
   %Calculate xr
   
    xr=xu - ((fxu*(xl-xu))/(fxl-fxu));
    fxr=f(xr);
    %Check which side xr will replace
        if sign(fxr)== sign(fxl)
            xl=xr;
            fxl=fxr;
            
        else
            xu=xr;
            fxu=fxr;
            
        end
%Set outputs from calculations      
        
root=xr;
fx=fxr;
iter=iter+1;
ea=abs((xr-oldxr)/xr)*100;
oldxr=xr;
end
 
fprintf('The estimated root of the function is')
fprintf('\n%.8f%.8f\n',root)
fprintf('\n');
fprintf('The value at the estimated root is')
fprintf('\n%.8f%.8f\n',fx)
fprintf('\n');
fprintf('The number of iterations performed is')
fprintf('\n%.0f%.0f\n',iter)
fprintf('\n');
fprintf('The aprroximate relative error is')
fprintf('\n%.8f%.8f\n',ea)
fprintf('\n');
