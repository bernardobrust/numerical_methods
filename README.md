# NumericalMethods
Effective implementations of standard numerical methods using GNU Octave.

I'm building this repo for the Numerical Calculus class on UERJ-IPRJ. Note that the papers have a more informal tone. If you'd like a more formal presentation of the topic check out the reference book.

**Reference book: Numerical Analysis, by Burden and Faires**

## Building
The papers are avaliable as `.tex` source files (with a Makefile) under [analysis/](analysis/) to build (requires `pdflatex` and `bibtex`):

``` shell
make PAPER=$METHOD # e.g bisection
```

The code for the implementations is avaliable under [methods/](methods/), you can run them with [GNU Octave](https://octave.org/) intalled in your system.

``` shell
octave $CATEGORY/$METHOD # e.g root_finding/bisection.m
```

In case you wonder why all the papers are in one directory while the implementations are in separate categories, I suggest you first question why do you need to run `pdflatex` 3 times to build the file.

## Method Listing:
An introduction to Numerical Methods is avaliable [here](analysis/introduction.tex).

### Root finding:
Methods for solving equations in the form $f(x) = 0$.

- [Bisection](methods/root_finding/bisection.m): Basically binary search for finding zeros of functions, it's slow, but it's reliable.
- [Newton-Raphson](methods/root_finding/newton_raphson.m): A **blazingly fast** method that uses interesting propreties of derivatives and Taylor Series to accelerate convergence, doesen't always work tho.

### Interpolation
Methods for approximating unknown values of unknown functions using known data points.

- [Lagrange's Approximating Polynomials](methods/interpolation/lagrange.m): The simplest form of polynomial interpolation.