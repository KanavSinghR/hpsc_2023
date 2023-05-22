program circle
	use circle_mod, only: pi, area
	implicit none
	real(kind = 8) :: radius, ar, pm
	radius = 10
	ar = area(radius)
	print *, "Area of circle is: ", ar
end program circle
