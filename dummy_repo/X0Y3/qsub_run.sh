#!/bin/bash -e
module load xilinx/2018.2
srun vivado -mode batch -source dummy.tcl

