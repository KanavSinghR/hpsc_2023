program hello_world
	use mpi
	implicit none
	integer :: ierr, numprocs, proc_num
	call mpi_init(ierr)
	
	call mpi_comm_size(mpi_comm_world, numprocs, ierr)
	call mpi_comm_rank(mpi_comm_world, proc_num, ierr)
	
	print *, "Hello from processor:", proc_num, "with total processors:", numprocs
	call mpi_finalize(ierr)
end program hello_world
