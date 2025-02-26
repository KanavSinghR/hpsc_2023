program control

	!$ use omp_lib
	implicit none
	integer :: n, i, nthreads
	real(kind = 8), dimension(100) :: x
	real(kind = 8) :: y
	logical :: anyzero
	
	nthreads = 2
	!$ call omp_set_num_threads(nthreads)
	!$ print "('Using OpenMP with ',i3,' threads')", nthreads
	
	n = 7
	do i = 1, n
		x(i) = float(i - 3)
		enddo
	
	y = -1.d300
	!$omp parallel do reduction(max: y)
	do i = 1, n
		y = max(y, x(i))
		enddo
	!$omp end parallel do
	print *, "Max of x = ", y
	
	anyzero = .false.
   	!$omp parallel do reduction(.or.: anyzero)
   	do i=1,n
      		anyzero = anyzero .or. (x(i) == 0.d0)
      		enddo
   	print *, 'anyzero = ',anyzero		
end program control
