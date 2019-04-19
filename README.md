# ObjectOrientedFortran
An example on how to create, use and compose objects in Fortran with minimal overhead


The model class “has” implementors, but in an abstract way, so one can “plug” different implementors (e.g. different numerical discretizations) without convoluted if statements. 

With careful choices on how the data is accessed in time-consuming loops, the overhead is minimal.

Moreover the compilation time is likely to be less for the model class, which depends only on the abstractions (less “use module” statements).
