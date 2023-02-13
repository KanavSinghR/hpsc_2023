x=float(input("Enter the value you want to calculate cube root of: "))
s=2;
kmax=100;
for k in range(kmax):
	t=s
	print("At iteration number %s, s= %s" %(k,s))
	s=(2*s+x/s**2)/3
	if s==t:
		break
print("The cube root is",x,s)

