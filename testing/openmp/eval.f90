program eval
	!$ use omp_lib
	implicit none
	integer :: i, n
	real(kind = 8) :: dx, x
	real(kind = 8), dimension(:), allocatable :: y
	character(len=32) :: arg
	!$ call omp_set_num_threads(8)
	
	call get_command_argument(1, arg)
    	read(arg , *) n
	allocate(y(n))
	dx = 1.d0 / (n+1.d0)
	!$omp parallel do private(x) firstprivate(dx)
	do i=1,n
		x = i*dx
		y(i) = exp(x)*cos(x)*sin(x)*sqrt(5*x+6.d0)
	enddo
end program eval
