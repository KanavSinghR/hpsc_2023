#!/bin/bash
#PBS -q day
#PBS -o out.o
#PBS -e out.e
#PBS -N me522_python
#PBS -l nodes=1:ppn=1
#PBS -V

cd ${PBS_O_WORKDIR}
echo "Running on: "
cat ${PBS_NODEFILE}
cat $PBS_NODEFILE > machines.list
echo "Program Output begins: "
if [ "$(cat $PBS_NODEFILE)" == $echo "n121.cluster.iitmandi.ac.in" ]; then
	source ~/virtualenvs/venv/bin/activate
	python -c 'from mysqrt import sqrtNT; sqrtNT(2,debug=True)'
else
	echo "File did not go to n121.cluster.iitmandi.ac.in"
fi
