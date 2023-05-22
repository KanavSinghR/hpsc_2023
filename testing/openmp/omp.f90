program factorial
  use omp_lib
  implicit none
  integer :: i, n, fact
  integer, parameter :: num_threads = 8
  fact = 1

  n = 15 ! set the input value

  call omp_set_num_threads(num_threads)

  !$OMP PARALLEL DO REDUCTION(*:fact)
  do i = 1, n
    fact = fact * i
  end do
  !$OMP END PARALLEL DO

  print *, "Factorial of", n, "is", fact

end program factorial

