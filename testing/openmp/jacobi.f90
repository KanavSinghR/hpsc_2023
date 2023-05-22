program jacobi
	!$ use omp_lib
	implicit none
	real(kind = 8), dimension(:,:), allocatable :: a, b, x
	integer :: i, j, n, iter
	logical :: any
	
	n = 2
	allocate(a(n, n))
	allocate(b(n, 1))
	allocate(x(n, 1))
	a = reshape((/2, 5, 1, 2/),(/2,2/))
	b = reshape((/21, 8/),(/2, 1/))
	x = reshape((/1, 1/),(/2, 1/))
	do i = 1, iter
		do j = 1, n
			x(j) = (1/a(j,j))(b(j) - a(j,j+1)*x(j+1))
			x(j+1) = (1/a(j,j))(b(j) - a(j,j+1)*x(j+1))
end program jacobi
