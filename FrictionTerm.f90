!Source abstract class
module Friction_term
   
   type, abstract, public :: Friction_term_type
      contains
      procedure(compute), pass(this), deferred, public :: compute
   end type Friction_term_type
      
   abstract interface
      integer function compute(this,input_data, output_data) result(err)
      import :: Friction_term_type
      class (Friction_term_type), intent(in)::this
      double precision, intent(in) :: input_data(:)
      double precision, intent(inout) :: output_data(:)
      end function compute
   end interface   
   
end module Friction_term