! Friction_term_two implements Friction_term
module Friction_term_two
   
   use Friction_term, only: Friction_term_type
   
   implicit none
   
   type, extends(Friction_term_type) :: Friction_term_two_type
      contains
         procedure, pass(this), public :: compute
   end type Friction_term_two_type
   
   contains
   
   integer function compute(this, input_data, output_data) result(err)
      class(Friction_term_two_type), intent(in) :: this
      double precision, intent(in) :: input_data(:)
      double precision, intent(inout) :: output_data(:)
      
      !locals
      integer :: i
      
      err = 0
      do i=1,size(input_data)
         output_data(i) = output_data(i) + input_data(i)**1.5
      end do

      return
   end function compute          
      
end module Friction_term_two