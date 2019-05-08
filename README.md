# ObjectOrientedFortran
An example on how to create, use and compose objects in Fortran with minimal overhead.

The model class “has” implementors, but in an abstract way, so one can “plug” different implementors (e.g. different numerical discretizations) without convoluted if statements. 

With careful choices on how the data is allocated and accessed in time-consuming loops, the overhead is minimal.

The model class only depends on interfaces and not on complex concrete modules (with data or function implementations), effectivly implementing the inversion of control principle. For large projects this avoids long compilation times and reduces the coupling between modules and functions.

Add abstract factories
