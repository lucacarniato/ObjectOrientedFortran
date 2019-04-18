! Gradient_term_one implements gradient_term
module Gradient_term_one
   
   use gradient_term, only: gradient_term_type
   
   implicit none
   
   type, extends(gradient_term_type) :: Gradient_term_one_type
      contains
         procedure, pass(this), public :: compute
   end type Gradient_term_one_type
   
   contains
   
   integer function compute(this, input_data, output_data) result(err)
      class(Gradient_term_one_type), intent(in) :: this
      double precision, intent(in) :: input_data(:)
      double precision, intent(inout) :: output_data(:)
      integer :: i
            
      err = 0
      do i=1,size(input_data)-1
         output_data(i) = output_data(i) + input_data(i+1)-input_data(i)
      end do
      
      return
   end function compute         
      
end module Gradient_term_one