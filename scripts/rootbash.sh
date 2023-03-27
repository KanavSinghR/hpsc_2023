#!/bin/bash
#PBS -q serial
#PBS -o roots.o
#PBS -e roots.e
#PBS -N me522_python
#PBS -l nodes=1:ppn=1
#PBS -V

cd ${PBS_O_WORKDIR}
echo "Running on: "
cat ${PBS_NODEFILE}
cat $PBS_NODEFILE > machines.list
echo "Program Output begins: "
source ~/virtualenvs/venv/bin/activate
for i in {2..1000..2}
do
	start=$(date +%s%N)
	var=`python root.py ${i}`
	end=$(date +%s%N)
	echo "Sqrt of ${i} is ${var}, time taken $(($(($end-$start)))) nanoseconds"
done
