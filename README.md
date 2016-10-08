Gmp Eigen Matrix Library
========================

The GEM library is an open source variable precision library for [matlab](http://www.mathworks.com/products/matlab/). It provides a simple way to perform matlab computations with a high precision.

The absence of support for high-precision sparse matrices in matlab, 500-fold overhead when performing simple comparison operations on high-precision dense matrices in matlab, and little choice outside of proprietary codes: here is a set of constraints which is hardly admissible when trying to build innovative high precision algorithms. In this context, the GEM library is an attempt to provide an open source option for basic high precision capabilities in matlab.

The library provides two data types:
 - **gem** for high precision dense matrices
 - **sgem** for high precision sparse matrices
and overloads [numerous matlab functions](doc/functions.md).

The library is coded in C++ and matlab. It currently relies on [GMP](https://gmplib.org/) for the high precision arithmetic (through [MPFR C++](http://www.holoborodko.com/pavel/mpfr/) and [MPFR](http://www.mpfr.org/)) and on [Eigen](http://eigen.tuxfamily.org/) for matrix manipulations.

At the moment, priority is given to functionality over performance. Nevertheless, appreciable perforance improvement is already available compared to matlab's builtin vpa type. With 100 digits of precision, for instance, a 100x100 matrix is transfered from _double to high precision_ 10x faster, from _high precision to double_ format 250x faster, and its _column-wise minimum_ is computed 25x faster. _Multiplication_ of two 100x100 dense matrices with 100-digits precision is 10 times faster with gem objects compared to matlab 2016a's vpa type. For a matrix of size 1000x1000 these ratios become respectively 14x, 1500~20000x, 500x, 10x (without even activating the library's multithreading capabilities).

Usage examples
--------------
Here is a very short overview of some ways in which . Once a high precision matrix has been created, it can be manipulated by applying to it the usual matlab functions.

 - `gem(2)`, `gem(1.23)` create 50-digits precision representations of the numbers 2 and 1.23. When translating a number from double form, exactly 15 digits are taken into account.
 - `gem('1.23456789123456789+2i')` creates a 50-digits representation of the number provided in text form (all digits within the working precision are taken into account
 - `gemWorkingPrecision(100)` updates the working precision to 100 digits
 - `eig(gemRand(100,100))` : computes the eigenvalues of a random 100x100 matrix
 - `notAnInteger = exp(sqrt(gem(163))*gem('pi')); display(notAnInteger, -1)` gives 262537412640768743.9999999999992500725971981856889 (a precision of -1 displays all available digits)
 - `sgem(eye(3))` creates a high precision sparse representation of the 3x3 identity matrix
 - `a=1./gem([1:7]); save('filename','a'); load('filename');` saves and loads a gem object


Installation
------------

This library comes pre-compiled for ubuntu 64bits. It is therefore straightforward to use : just add the gem folder into matlab's path, and it is ready to use. This can be done by running the command `path(path,'/path_to_the_gem_folder/gem')`.

If you are using a different platform (32 bits, mac os or windows), or in case you use an older version of linux/matlab than the one on which this was compiled, you need to compile it. Below are instructions


Installation with compilation
-----------------------------

Here are the instructions for compiling the GEM library on *ubuntu*.

1. Check out this repository in the folder of your choice
2. Download the latest version of Eigen on [eigen.tuxfamily.org](eigen.tuxfamily.org) and place it into the src folder.
3. Install the gmp and mpfrc++ libraries with the command
`sudo apt-get install libmpfrc++-dev libgmp-dev`
4. Start matlab and go to the gem folder.
5. Type `make`. This will launch the compilation of the library. If everything goes fine, the program will return 'Compilation successful'.
6. Add the gem folder to your matlab path. You can now safely play with high precision objects :-)

Compilation on another platform: unfortunately, I don't have such platform to make tests. Due to the simplifity of the compilation instructions involved, it should be rather straightforward to compile the GEM library on MacOSX or Windows. The best way to start is to make sure that a running version of [gcc](https://gcc.gnu.org/) is installed on your machine. Once this is done, you can try running the `make` program from within matlab and follow the instructions. If you manage to complete such compilation, please make sure to update this file on [gitlab](https://gitlab.com/jdbancal/gem) to describe your experience. Many people will thank you.


License
-------

The GEM library is free and open source. It is therefore also free for academic use. Anyone can [contribute](doc/howToContribute.md) on the [gitlab page](https://gitlab.com/jdbancal/gem). The source code is distributed under a MPL2 license. See [COPYING.md](COPYING.md) for more details.

