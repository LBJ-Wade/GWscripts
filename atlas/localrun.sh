#!/bin/sh

# configuration files
PRIOR_CONFIG=prior.ini
DATA_CONFIG=data.ini
SAMPLER_CONFIG=sampler.ini

OUTPUT_PATH=result.hdf

# the following sets the number of cores to use; adjust as needed to
# your computer's capabilities
NPROCS=28

# run sampler
# Running with OMP_NUM_THREADS=1 stops lalsimulation
# from spawning multiple jobs that would otherwise be used
# by pycbc_inference and cause a reduced runtime.
OMP_NUM_THREADS=1 \
pycbc_inference --verbose \
    --seed 1897234 \
    --config-file ${PRIOR_CONFIG} ${DATA_CONFIG} ${SAMPLER_CONFIG} \
    --output-file ${OUTPUT_PATH} \
    --nprocesses ${NPROCS} \
    --force
