! model implementation (please note only the abstract module was used!)
module Model
   
   use Friction_term, only: Friction_term_type 
   use gradient_term, only: gradient_term_type 

   type, public :: model_type
      class(*), pointer :: Friction_term_impl
      class(*), pointer :: gradient_term_impl
      double precision, allocatable, dimension(:) :: model_data
      contains
      procedure :: compute => model_compute
      procedure :: constructor => model_constructor
   end type model_type
      
   contains
   
   integer function model_compute(this, output_data) result(err)
      class (model_type) :: this
      double precision, allocatable, dimension(:), intent(inout) :: output_data
      class(*), pointer:: p
      err = 0
      
      allocate(output_data(size(this%model_data)), stat = err)
      
      output_data = 0
      select type(p=>this%Friction_term_impl)
      class is (Friction_term_type)
         err =  p%compute(this%model_data, output_data)
      end select
      
      select type(p=>this%gradient_term_impl)
      class is (gradient_term_type)
         err =  p%compute(this%model_data, output_data)
      end select
            
      return
   end function model_compute
   
   integer function model_constructor(this, Friction_term_impl, gradient_term_impl, model_data_size) result(err)
      class (model_type)  :: this
      class(*), target    :: Friction_term_impl
      class(*), target    :: gradient_term_impl
      integer, intent(in) :: model_data_size
      
      !locals
      integer :: i
      err = 0
      this%Friction_term_impl=>Friction_term_impl
      this%gradient_term_impl=>gradient_term_impl
      allocate(this%model_data(model_data_size))
      
      !set the model data, could be for example be read from file
      do i=1,model_data_size
         this%model_data(i) = dble(i)/dble(model_data_size);
      end do
      
      return
   end function model_constructor
   
end module Model