# NumericalMethods
Effective implementations of standard numerical methods using GNU Octave.

This repo was built by me for the Numerical Calculus class on UERJ-IPRJ. Note that the papers have a more informal tone. If you'd like a more formal presentation of the topic check out the reference book.

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

## Method Listing:
### Root finding:
Methods for solving equations in the form $f(x) = x$.

- [Bisection](methods/root_finding/bisection.m): Basically binary search for finding zeros of functions, it's slow, but it's reliable.
- [Newton-Raphson](methods/root_finding/newton_raphson.m): A **blazingly fast** method that uses interesting propreties of derivatives and Taylor Series to accelerate convergence, doesen't always work tho.
