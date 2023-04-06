import numpy as np
import random
import math

def monte_carlo_pi(n):
	x=np.zeros(n)
	y=np.zeros(n)
	for i in range(n):
		x_1=random.uniform(-0.5,0.5)
		y_1=random.uniform(-0.5,0.5)
		z_1=math.sqrt(x_1**2 + y_1**2)
		if (z_1<0.5):
			x[i]=x_1
			y[i]=y_1
	k=0
	for i in range(n):
		if (x[i]!=0):
			k=k+1
	pi=4*k/n
	return pi

def test_main():
	xvalues=[100, 200, 300, 10**6]
	for x in xvalues:
		print("Testing with n=",x)
		pi=monte_carlo_pi(x)
		pi_numpy=np.pi
		print("pi is: ", pi)
		assert abs((pi-pi_numpy)/pi_numpy) > 0.2, "Your pi does not agree with numpy pi"

if __name__=='__main__':
	test_main()