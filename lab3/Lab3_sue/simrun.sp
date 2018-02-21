***** Spice Netlist for Cell 'Lab3_sue' *****

************** Module Lab3_sue **************
r3 vin n0 50 noisy=0
c2 gnd vout 101.1p ic=0
r2 vout gnd 1meg noisy=0
c3 gnd vout 13p ic=0
r1 vin n1 res1 noisy=0
c0 gnd n1 cap1 ic=0
c1 gnd vout cap2 ic=0
r0 n1 vout res2 noisy=0
c4 gnd vin 101.1p ic=0
v0 n0 gnd dc 0v ac 1v sin('0v' '2v' '800' '0s') 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.ac dec 201 100 10e3
.global gnd
.param res1=1600
.param res2=33000
.param cap1=1e-07
.param cap2=4.7e-09
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end

