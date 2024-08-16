@echo off
setlocal
vrad3 -map maps/smart_net_playground.vmap -script lpv.vrad3 -entrypoint lpv_compute -init=lpv_init_244778352 -directfile=lpv_244778352_direct_0_0_0.dat -indirectfile=lpv_244778352_indirect_0_0_0.dat -startx=0 -starty=0 -startz=0 -endx=16 -endy=16 -endz=12 -minspp=256 -maxspp=1024 -errortol=0.010000 -threads 14 -outdir results/outputs
vrad3 -map maps/smart_net_playground.vmap -script lpv.vrad3 -entrypoint lpv_compute -init=lpv_init_244778353 -directfile=lpv_244778353_direct_0_0_0.dat -indirectfile=lpv_244778353_indirect_0_0_0.dat -startx=0 -starty=0 -startz=0 -endx=4 -endy=16 -endz=8 -minspp=256 -maxspp=1024 -errortol=0.010000 -threads 14 -outdir results/outputs
