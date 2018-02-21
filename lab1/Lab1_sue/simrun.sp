***** Spice Netlist for Cell 'Lab1_sue' *****

************** Module Lab1_sue **************
r2 n0 v2 50 noisy=0
r3 v2 vout res noisy=0
r1 gnd vout res noisy=0
r0 gnd vout 1meg noisy=0
c0 gnd v2 101.1p ic=0
c1 gnd vout 101.1p ic=0
c2 gnd vout 13p ic=0
v0 n0 gnd dc 0v ac 1v sin('0v' '1v' '1k' '0s') 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 60u 20m
.global gnd
.param res=1e+07
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end

