# montecarlopi
Example code written in Fortran. For finding a value of pi by the Monte Carlo Method.
This method follows the example outlined here:
https://en.wikipedia.org/wiki/Monte_Carlo_method
This is a common trial of the Monte Carlo method, and takes advantage of Fortran's relative speed.
This comes within 0.047% of Google's value for pi in ~0.125s, on my laptop.
The timing code inserted is written for the gcc gfortran compiler.
