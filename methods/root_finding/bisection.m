% Theory + analysis at analysis/bisection.tex

function [root, iter, err] = bisection(f, a, b, tol = 1e-6, max_iter = 128)
  % 1. Intermediate Value Theorem validation
  fa = f(a);
  fb = f(b);

  % The theorem states that fa * fb < 0 for a root to exist, this is ineficient.
  % We can instead use sign(fa) == sign(fb), which avoids a multiplication
  if sign(fa) == sign(fb)
    error("bisection:invalidInterval", ...
    "Function must have opposite signs at endpoints: f(a)=%.6f, f(b)=%.6f", fa, fb);
  endif

  % 2. Iterative loop
  for iter = 1:max_iter
    % Half-width interval calculation
    err = (b - a) / 2;
    root = a + err;
    fmid = f(root);

    % Check convergence criteria
    if err < tol || fmid == 0
      return;
    endif

    % Narrow down search interval using sign multiplication
    if sign(fmid) == sign(fa)
      a = root;
      fa = fmid;
    else
      b = root;
    endif
  endfor

  warning("bisection:maxIterReached", "Reached maximum iterations without converging.");
endfunction

% Arbitrary function execution:
expr = input("Enter f(x): ", "s");
f = eval(["@(x) " expr]);

interval = input("Enter the interval [a, b]: ");
eps = input("Enter the tolerance/epsilon: ");
[root, iterations, final_err] = bisection(f, interval(1), interval(2), eps);

format long
disp("Root found:") , disp(root);
printf("Iterations: %d\n", iterations);

format long e
disp("Estimated error:"), disp(final_err);
