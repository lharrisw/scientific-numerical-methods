# Scientific Numerical Methods

This repository contains MATLAB implementations developed while studying numerical analysis, differential equations, and scientific computing.

The collection includes numerical integration methods, root-finding algorithms, an ordinary differential equation solver, a partial differential equation application, and related computational mathematics routines.

## Methods Included

### Numerical Integration

The repository contains implementations of several classical quadrature methods.

#### Composite Rules

- Composite midpoint rule
- Composite trapezoidal rule
- Composite Simpson's rule
- Composite Simpson's 3/8 rule

#### Adaptive Rules

- Adaptive Simpson's 1/3 rule
- Adaptive Simpson's 3/8 rule

#### Gaussian Quadrature

- Gaussian quadrature

#### Newton-Cotes Methods

- Computation of Newton-Cotes weights

### Root Finding

The repository contains an implementation of Newton's method for approximating roots of nonlinear equations.

For a differentiable function $f$, Newton's iteration is

```math
x_{n+1}
=
x_n
-
\frac{f(x_n)}{f'(x_n)}.
```

### Ordinary Differential Equations

The repository contains an implementation of Heun's method, a second-order predictor-corrector method for initial-value problems.

For an equation

```math
y' = f(t,y),
```

Heun's method uses an Euler prediction followed by a corrected slope estimate.

### Partial Differential Equations

The repository includes a MATLAB project involving the wave equation on a disk.

For a scalar field $u$, the classical wave equation has the form

```math
\frac{\partial^2 u}{\partial t^2}
=
c^2 \Delta u.
```

### Geometry and Parametric Computation

Additional MATLAB routines address arc length and computations involving parametric representations.

### Utilities

A base-conversion routine is also included as a general computational utility.

## Repository Structure

```text
src/
├── numerical_integration/
│   ├── adaptive_rules/
│   ├── composite_rules/
│   ├── gaussian_quadrature/
│   └── newton_cotes/
├── root_finding/
├── differential_equations/
│   ├── ode/
│   └── pde/
├── geometry/
└── utilities/
```

## Purpose

These programs were developed as part of my study of numerical and applied mathematics.

The repository demonstrates the implementation of mathematical algorithms in MATLAB, including translating analytic formulas into computational procedures and applying numerical methods to problems in integration, nonlinear equations, and differential equations.

## Languages and Tools

- MATLAB
- Numerical analysis
- Scientific computing

## Future Improvements

- Add documentation for the inputs and outputs of each MATLAB function.
- Add worked examples for each numerical method.
- Add numerical error and convergence studies.
- Add automated tests for selected algorithms.
- Standardize function documentation and naming.
- Reimplement selected methods in Python for comparison.
- Add visualizations for the differential-equation examples.

## Author

**Latimer Galvan Harris-Ward**

M.S. Mathematics  
B.S. Applied Mathematics  
B.S. Physics, Concentration in Mathematical Physics
