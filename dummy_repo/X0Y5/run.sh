#!/bin/bash -e
module load ~/Xilinx/SDx/2018.2/settings64.sh
srun vivado -mode batch -source dummy.tcl

