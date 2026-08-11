% Theory + analysis at analysis/newton_raphson.tex

function [root, iter] = newton_raphson(f, f_prime, p0, tol = 1e-6, max_iter = 128)
  % Iterative loop
  for iter = 1:max_iter
    % Check divergence criteria (derivative close to 0)
    fp = f_prime(p0);

    if abs(fp) < 1e-6
      warning("newton_raphson:possibleDivergence", "f'(p0) is too small, possible divergence.");
      return;
    endif

    root = p0 - f(p0) / fp;

    % Check convergence criteria
    if abs(root - p0) < tol
      return;
    endif

    p0 = root;
  endfor

  warning("newton_raphson:maxIterReached", "Reached maximum iterations without converging.");
endfunction

% Arbitrary function execution:
expr = input("Enter f(x): ", "s");
f = eval(["@(x) " expr]);

% Taking the derivative of f
auto = yes_or_no("Would you like automatic derivation? (requires sympy) ");
if auto
  % We require the symbolic package for taking the derivative of the function
  % You may need to load sympy into your environment with something like:
  % "> source ~/venvs/sympy/bin/activate"
  pkg load symbolic
  syms x
  f_prime = function_handle(diff(expr, x, 1));
else
  expr_prime = input("Enter f'(x): ", "s");
  f_prime = eval(["@(x) " expr_prime]);
endif

initial_guess = input("Enter the initial guess: ");
eps = input("Enter the tolerance/epsilon: ");
[root, iterations] = newton_raphson(f, f_prime, initial_guess, eps);

format long
disp("Root found:"), disp(root);
printf("Iterations: %d\n", iterations);
