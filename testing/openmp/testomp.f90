program testomp
	!$ use omp_lib
	IMPLICIT NONE
	integer :: thread_num
	!$ call omp_set_num_threads(2)
	
	!$omp parallel private(thread_num)
	!$ thread_num = omp_get_thread_num()
	print *, "Using OPENMP with 2 threads. Currently in thread", thread_num
	!$omp end parallel
end program testomp	
