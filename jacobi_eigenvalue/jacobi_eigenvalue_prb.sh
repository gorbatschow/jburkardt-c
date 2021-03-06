#!/bin/bash
#
gcc -c -I/$HOME/include jacobi_eigenvalue_prb.c
if [ $? -ne 0 ]; then
  echo "Errors compiling jacobi_eigenvalue_prb.c"
  exit
fi
#
gcc jacobi_eigenvalue_prb.o /$HOME/libc/$ARCH/jacobi_eigenvalue.o -lm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading jacobi_eigenvalue_prb.o."
  exit
fi
#
rm jacobi_eigenvalue_prb.o
#
mv a.out jacobi_eigenvalue_prb
./jacobi_eigenvalue_prb > jacobi_eigenvalue_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running jacobi_eigenvalue_prb."
  exit
fi
rm jacobi_eigenvalue_prb
#
echo "Program output written to jacobi_eigenvalue_prb_output.txt"
