***** Spice Netlist for Cell 'Lab2_sue' *****

************** Module Lab2_sue **************
r0 n0 va 50 noisy=0
r1 va vb 160k noisy=0
c0 gnd vb 1.5n ic=0
v0 n0 gnd dc 0v ac 1v sin('0v' '4v' 'freq' '0s') 
r2 gnd vb 1meg noisy=0
c1 gnd va 101.1p ic=0
c2 gnd vb 13p ic=0
c3 gnd vb 101.1p ic=0
r3 gnd va 1meg noisy=0
c4 gnd va 13p ic=0





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 2.5e-08 0.00115 0.001 0
.global gnd
.param freq=40000
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end

