program monte_carlo_pi_mpi
	use mpi
	implicit none
	integer :: n, ierr, numprocs, proc_num, i, istart, iend, points_per_proc, iter, iter_val
	real(kind = 8), dimension(:), allocatable :: xx, yy
	real(kind = 8) :: x, y, pi
	
	
	n = 10**8
	iter = 0
	allocate(xx(n))
	allocate(yy(n))
	call random_number(xx)
	call random_number(yy)
	
	call mpi_init(ierr)
	call mpi_comm_size(mpi_comm_world, numprocs, ierr)
	call mpi_comm_rank(mpi_comm_world, proc_num, ierr)
	
	!No need! Just to make things sure
	if (proc_num == 0) then
		points_per_proc = (n + numprocs - 1)/numprocs
	end if
	call mpi_bcast(points_per_proc, 1, mpi_integer, 0, mpi_comm_world, ierr)
	
	
	istart = proc_num * points_per_proc + 1
	iend = min((proc_num + 1) * points_per_proc, n)
	
	do i = istart, iend
		x = xx(i) - 0.5
		y = yy(i) - 0.5
		
		if (x**2 + y**2 < 0.25) then 
			iter = iter + 1
		end if
	end do
	call mpi_reduce(iter, iter_val, 1, mpi_integer, mpi_sum, 0, &
                        mpi_comm_world, ierr)
	if (proc_num == 0) then
		pi = 4.0 * iter_val/n
		print *, "The value of pi is:", pi
	end if
	call mpi_finalize(ierr)



end program monte_carlo_pi_mpi
