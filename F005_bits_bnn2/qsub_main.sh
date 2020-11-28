#!/bin/bash -e
emailAddr="youremail@qsub.com"

qsub -N mk_overlay -q 70s -m abe -M $emailAddr -cwd ./qsub_run.sh
