function [I] = Simpson(x,y)
%Mech105
%Cameron McCormick
%   Function to find the integration over a range of values using simpson's
%   rule
%I=value of the integral
%y=values of the function with respect to x
%x=function inputs
testy=length(y);
testx=length(x);
%Check for any errors
if testx~=testy;
    error('The length of the two inputs must be equal')
end
testspace=linspace(x(1),x(testx),testx);
if testspace~=x
    error('The x inputs must be equally spaced')
end
if testx < 3
    error('Must have at least 3 points')
end
%Check if the function is even or odd
evenodd=mod(testx,2);
if evenodd==1
    %Use 1/3 Rule since it is an odd number
    midpoint=(testx+1)/2;
    h=(x(testx)-x(1))/2;
    I=(1/3)*h*(y(1)+(4*y(midpoint))+y(testx));
else
    warning('The Integral will work better with an odd numbered of inputs. With an even number the trapezoidal rule must be used on the last interval')
    
    %Use 1/3 rule and trapezoidal rule since it is an even number
    midpoint=(testx)/2;
    b=testx-1;
    h=(x(b)-x(1))/2;
    I1=((1/3)*h*(y(1)+(4*y(midpoint))+y(b)));
    I=I1+((x(testx)-x(b))*(1/2)*(y(b)+y(testx)));
    
end
fprintf('The estimated Integral of the input is')
fprintf('\n%.5f%.5f\n',I)
fprintf('\n');
end

