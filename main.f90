   program test
   
   use Model
   use Friction_term_one, only: Friction_term_one_type
   use Friction_term_two, only: Friction_term_two_type
   use Gradient_term_one, only: Gradient_term_one_type
   use Gradient_term_two, only: Gradient_term_two_type   
   use pointer_wrapping

   implicit none

   !model compositions 
   type(model_type) :: model_1
   type(model_type) :: model_2

   !implementors, could be substitute by pointers, so instantiation can be selected at runtime
   type(Friction_term_one_type), target   :: Friction_term_one_instance   
   type(Friction_term_two_type), target   :: Friction_term_two_instance
   type(Gradient_term_one_type), target :: gradient_term_one_instance
   type(Gradient_term_two_type), target :: gradient_term_two_instance
   
   !locals
   integer :: err
   double precision, allocatable, dimension(:) :: output_model_1
   double precision, allocatable, dimension(:) :: output_model_2

   !build the models
   err = model_1%constructor(Friction_term_one_instance,gradient_term_one_instance,1000000)
   err = model_1%compute(output_model_1) 
   print *, 'model 1 result ', sum(output_model_1)
   
   err = model_2%constructor(Friction_term_two_instance,gradient_term_two_instance,1000000)
   err = model_2%compute(output_model_2)
   print *, 'model 2 result ', sum(output_model_2)

   end program