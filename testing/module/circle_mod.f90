module circle_mod
	implicit none
	real(kind = 8), parameter :: pi=3.14
	contains
	
	real(kind = 8) function perimeter(radius)
		implicit none
		real(kind = 8), intent(in) :: radius
		perimeter = 2*pi*radius
	end function perimeter
	
	real(kind = 8) function area(radius)
		implicit none
		real (kind = 8), intent(in) :: radius
		area = pi*(radius**2)
	end function area
	
end module
