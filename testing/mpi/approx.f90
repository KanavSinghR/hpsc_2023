program approx_pi
	use MPI
	implicit none
	integer :: ierr, numprocs, proc_num, n, points_per_proc, i, istart, iend
	real(kind = 8) :: dx, x, pisum, pi
	call MPI_INIT(ierr)
	call MPI_COMM_SIZE(MPI_COMM_WORLD, numprocs, ierr)
	call MPI_COMM_RANK(MPI_COMM_WORLD, proc_num, ierr)
	
	if (proc_num == 0) n = 10**9
	
	points_per_proc = (n + numprocs - 1)/numprocs
	istart = proc_num * points_per_proc + 1
	iend = min((proc_num + 1)*points_per_proc, n)
	
	pisum = 0.d0
	dx = 1.d0/n
	do i = istart, iend
		x = (i - (1.0/2.0))*dx
		pisum = pisum + 1.0/(1.0 + x**2)
	end do
	
	call MPI_REDUCE(pisum, pi, 1, MPI_DOUBLE_PRECISION, MPI_SUM, 0, MPI_COMM_WORLD, ierr)
	
	if (proc_num == 0) then 
		pi = 4*dx*pi
		print *, pi
	end if
	
	call MPI_FINALIZE(ierr)


end program approx_pi
