!Source abstract class
module Gradient_term
   
   type, abstract, public :: Gradient_term_type
      contains
      procedure(compute), pass(this), deferred, public :: compute
   end type Gradient_term_type
      
   abstract interface
      integer function compute(this,input_data, output_data) result(err)
      import :: Gradient_term_type
      class (Gradient_term_type), intent(in)::this
      double precision, intent(in) :: input_data(:)
      double precision, intent(inout) :: output_data(:)
      end function compute
   end interface   
   
end module Gradient_term