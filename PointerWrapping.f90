module pointer_wrapping
   ! I need to create a type to be able to create an array of "unlimited" polymorphic pointers
   ! https://software.intel.com/en-us/forums/intel-visual-fortran-compiler-for-windows/topic/280765
   type wrap_pointer
      class(*), pointer :: item
   end type wrap_pointer
end module