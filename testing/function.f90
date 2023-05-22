program func
	implicit none
	real, dimension(10) :: var
	real(kind = 8) :: x, y, a, b, z
	real(kind = 8), dimension(3) :: c, d
	real(kind = 8), external :: f
	real(kind = 8), dimension(2,3) :: array
	real(kind = 8), dimension(:,:), allocatable :: arr
	integer :: i
	x = 9.d0
	y = 10.d0
	d = (/10.0, 11.0, 12.0/)
	do i = 1,10
		var(i) = f(x,y)
		end do
	do i = 1,10
		print *, var(i)
		end do
	call sub(x, y, z, a, b, c, d)
	print *, "x", x, "y", y, "z", z, "a", a, "b", b
	print *, "c", c, "d", d
	
	array = reshape((/1., 2., 3., 4., 5., 6./), (/2, 3/))
	do i = 1, 2
		print *, array(i,:)
		end do
		
	allocate(arr(2,3))
	arr = array**2
	do i = 1, 2
		print *, arr(i, :)
		end do
		
end program func

real(kind = 8) function f(x,y)
	implicit none
	real(kind = 8), intent(in) :: x, y
	f = x*y
	end function f
	
subroutine sub(x,y,z,a,b,c,d)
	implicit none
	real(kind = 8), intent(in) :: x, y
	real(kind = 8), intent(inout) :: a, b
	real(kind = 8), intent(out) :: z
	real(kind = 8), dimension(3), intent(out) :: c
	real(kind = 8), dimension(3), intent(in) :: d
	z = 2*x*y
	a = x/2
	b = y/2
	c = d**2
end subroutine sub
