% Neville's Method (a.k.a iterative lagrange interpolation)
% Theory + analysis at analysis/lagrange.tex

% The Neville Q is as follows (mathematically):
% x0 | Q(0, 0)
% x1 | Q(1, 0) | Q(1, 1) |
% x2 | Q(2, 0) | Q(2, 1) | Q(2, 2) |
% x3 | Q(3, 0) | Q(3, 1) | Q(3, 2) | Q(3, 3) |
% x4 | Q(4, 0) | Q(4, 1) | Q(4, 2) | Q(4, 3) | Q(4, 4)

% The notation Q(i, j) is equivalent to P(i ... j)
% Empty entries are not calculated, but displayed as zeros

%              Octave columns
%               1     2     3     4
%            +-----+-----+-----+-----+
% row 1      | Q00 |
% row 2      | Q10 | Q11 |
% row 3      | Q20 | Q21 | Q22 |
% row 4      | Q30 | Q31 | Q32 | Q33 |
%            +-----+-----+-----+-----+

function [entry] = Q(i, j, x, xs, Qs)
  if j == 1
    entry = Qs(i, 1);
  else
    entry = ((x - xs(i - j + 1)) * Qs(i, j - 1) ...
             - (x - xs(i)) * Qs(i - 1, j - 1)) ...
            / (xs(i) - xs(i - j + 1));
  endif
endfunction

function [Qs] = neville (xs, ys, x)
  Qs = zeros(length(xs), length(xs));
  Qs(:, 1) = ys;

  for i = 1:length(xs)
    for j = 1:i
      Qs(i, j) = Q(i, j, x, xs, Qs);
    endfor
  endfor
endfunction

xs = input ("Enter the x values [x0; x1; ... xn]: ");
ys = input ("Enter the y values [y0; y1; ... yn]: ");
x = input ("Enter the point where you want f(x) to be estimated: ");

Qs = neville(xs, ys, x);

disp("Final table: "), disp(Qs);
printf("Interpolated value (max degree) at x = %g: %f\n", x, Qs(end,end));
