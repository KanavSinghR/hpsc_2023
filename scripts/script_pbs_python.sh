#!/bin/bash
#PBS -q serial
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
source ~/virtualenvs/venv/bin/activate
python -c 'from mysqrt import sqrtNT; sqrtNT(2,debug=True)'



