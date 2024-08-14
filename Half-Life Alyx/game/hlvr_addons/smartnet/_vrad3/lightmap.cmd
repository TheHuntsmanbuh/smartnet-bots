@echo off
setlocal
vrad3 -map maps/smart_net_playground.vmap -script script.vrad3 -entrypoint lm_compute -blockfile=lm_block_00000000.dat -blocknum=0 -threads 14 -outdir results/outputs
vrad3 -map maps/smart_net_playground.vmap -script script.vrad3 -entrypoint lm_compute -blockfile=lm_block_00000001.dat -blocknum=1 -threads 14 -outdir results/outputs
vrad3 -map maps/smart_net_playground.vmap -script script.vrad3 -entrypoint lm_compute -blockfile=lm_block_00000002.dat -blocknum=2 -threads 14 -outdir results/outputs
vrad3 -map maps/smart_net_playground.vmap -script script.vrad3 -entrypoint lm_compute -blockfile=lm_block_00000003.dat -blocknum=3 -threads 14 -outdir results/outputs
