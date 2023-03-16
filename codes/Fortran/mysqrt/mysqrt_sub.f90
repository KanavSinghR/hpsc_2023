program mysqrt_sub
!Function computes squareroot of a number using newton's method
	implicit none

	real (kind=8) :: x, y, sqrt_true
	integer :: iter
	logical :: debug
	
	sqrt_true=sqrt(x)
	y=2.d0
	x=y
	debug=.true.
	call sqrtNT_sub(x, iter, debug)
	print *, "Squareroot of ", y, " is ", x, " and number of iterations taken to converge is ", iter

end program mysqrt_sub

subroutine sqrtNT_sub(x, iter, debug)
	implicit none

	real (kind=8), intent(inout) :: x
	real (kind=8) :: sum, s_init, tol, stemp , delta_s
	integer, intent(out) :: iter 
	integer :: i, kmax
	logical, intent(in) :: debug

	s_init=1.d0
	kmax=100
	tol=1.0e-14

	do i=1, kmax
		stemp=s_init
		s_init=0.5*(s_init+x/s_init)
		delta_s=abs(s_init-stemp)

		if (debug .eqv. .true.) then
			print *, "Squareroot value: ",s_init , "Iteration number: ", i
		endif

		if ((delta_s/x)<tol) then
			iter=i
			exit
		endif
	enddo

	if (i>=kmax) then 
		print *, "Newton's method did not converge for %d values", kmax
	endif
	x=s_init
end subroutine sqrtNT_sub