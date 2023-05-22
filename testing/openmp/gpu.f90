program hello_world
  use omp_lib

  implicit none
  ! Variables
  integer, parameter :: n = 10
  integer :: i, tid
  call omp_set_num_threads(16)
  ! Parallel region
  !$omp target teams distribute parallel do
  do i = 1, n
    tid = omp_get_thread_num()

    ! Print message
    print *, 'Hello, World! I am thread', tid
  end do

  ! End program
  stop
end program hello_world
