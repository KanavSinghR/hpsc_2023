"""
This function approximates the cube root a number.
"""
import pytest
def mycubert(x,debug=False):
	"""
	The value entered will be evaluated and approximated against some initial guess.
	<debug> will show all the iteration steps if set true (The default value of debug is False).
	"""
	s=2;
	kmax=100;
	for k in range(kmax):
		t=s
		if debug:
			print("At iteration number %s, s= %s" %(k,s))
		s=(2*s+x/s**2)/3
		if s==t:
			break #This will stop the loop in case of early convergence(saves time).
	return(s)
	
###############################Test No. 1###############################
def test_main():
	"""
	This will test the value of mycubert function against the value of the inbuilt(in numpy library) cbrt function.
	The value of tolerance is set to 10^-14.
	The test will run for 50 values of x (equally spaced between -10^5 and 10^5)
	"""
	from numpy import cbrt
	from numpy import linspace
	xvalues=linspace(-10**5,10**5) #creates an equally spaced array
	for x in xvalues:
		print("Testing with x=%20.15e" %x)
		s=mycubert(x)
		s_numpy=cbrt(x)
		print("cubert s = %20.15e, numpy s = %20.15e" %(s,s_numpy))
		assert abs(s-s_numpy) < 10**-14, "Your cubert does not agree with numpy cbrt"
