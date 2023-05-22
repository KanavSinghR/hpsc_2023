program monte
	!$ use omp_lib
	implicit none
	real(kind = 8), dimension(:), allocatable :: x, y, z
	real(kind = 8) :: pi
	integer :: n, i, iter, num
	character(len = 32) :: arg
	call get_command_argument(1, arg)
    	read(arg , *) n
	allocate(x(n))
	allocate(y(n))
	allocate(z(n))
	
	call get_command_argument(2, arg)
    	read(arg , *) num
	
	call random_number(x)
	call random_number(y)
	
	
	!$ call omp_set_num_threads(num)
	!$omp parallel
	!$omp sections
	
	!$omp section
	x = x - 0.5
	
	!$omp section
	y = y - 0.5
	
	!$omp end sections
	!$omp single
	z = x**2 + y**2
	!$omp end single
	
	iter = 0
	!$omp do reduction(+:iter)
	do i = 1, n
		if (z(i) < 0.25) then
			iter = iter + 1
		end if
	end do
	!$omp end do
	!$omp end parallel
	pi = 4.0*iter/n
	print *, "The value of pi is: ", pi
end program monte
