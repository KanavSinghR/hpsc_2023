program mysqrt
!Function computes squareroot of a number using newton's method
	implicit none

	real (kind=8) :: x, y, sqrt_true
	real (kind=8), external :: sqrtNT
	
	sqrt_true=sqrt(x)
	x=2.d0
	y=sqrtNT(x)
	print *,"x= ", x
	print *,"y= ", y
	print *, "sqrt_true= ", sqrt(x)
	print *, "error= ",sqrt(x)-y
end program mysqrt

function sqrtNT(x)
	implicit none
	real (kind=8), intent(in) :: x
	real (kind=8) :: sum, s, tol, stemp, sqrtNT, delta_s
	integer :: i, kmax
	s=1.d0
	kmax=100
	tol=1.0e-14

	do i=1, kmax
		stemp=s
		s=0.5*(s+x/s)
		delta_s=abs(s-stemp)
		if ((delta_s/x)<tol) then
			exit
		endif
	enddo

	if (i>=kmax) then 
			print *, "Newton's method did not converge for %d values", kmax
	sqrtNT=s
end function sqrtNT