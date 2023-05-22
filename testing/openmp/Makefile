COMPILER = gfortran
FLAG = -fopenmp
num_points = 100000
num_threads_default = 10
FILE_NAME = my_monte_carlo.f90

output.txt: monte.exe
	./monte.exe ${num_points} ${num_threads_default} > output.txt

monte.exe: my_monte_carlo.f90
	${COMPILER} ${FLAG} ${FILE_NAME} -o monte.exe
	
clean: monte.exe
	rm monte.exe

clobber: output.txt
	rm output.txt
