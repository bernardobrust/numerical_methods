% Lagrange Interpolation
% This file calculates using the highest degree polynomial, which is not always
% the best approximation
% Theory + analysis at analysis/lagrange.tex

% The book uses 0-indexed formulas, but Octave is 1-indexed
% Lagrange polynomial
function [lp] = L (n, k, x, xs)
  % 2 things interesting about this line:
  % 1. "arrayfun" is basically a list comprehension from functional languages
  % 2. "ifelse" is a ternary operator
  % This is basically a product notation
  lp = prod (arrayfun (@(i) ifelse (i != k, (x - xs(i)) / (xs(k) - xs(i)), 1),
            1:n));
endfunction

function [lag] = lagrange (x, xs, ys)
  % And now the summation notation
  lag = sum (arrayfun (@(k) ys(k) * L(length(xs), k, x, xs), 1:length(xs)));
endfunction

xs = input ("Enter the x values [x0, x1, ... xn]: ");
ys = input ("Enter the y values [y0, y1, ... yn]: ");

if length (xs) != length( ys)
  error ("Different amount of x points and y points");
endif

x = input ("Enter the point where you want f(x) to be estimated: ");

r = lagrange (x, xs, ys);

format long
printf ("f(%f) is approximatly ", x), disp (r);
