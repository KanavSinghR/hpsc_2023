program test
	use mpi
	implicit none
	integer :: ierr, numproc, proc_num
	
	call mpi_init(ierr)
	
	call mpi_comm_size(mpi_comm_world, numproc, ierr)
	call mpi_comm_rank(mpi_comm_world, proc_num, ierr)
	print *, "Hello from", proc_num, "with", numproc, "processes"
	
	call mpi_finalize(ierr)
end program test
