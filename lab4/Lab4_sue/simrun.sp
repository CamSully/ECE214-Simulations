***** Spice Netlist for Cell 'Lab4_sue' *****

************** Module Lab4_sue **************
r0 vin n0 res1 noisy=0
r1 n0 vout res2 noisy=0
v1 n1 gnd dc='10' ac='1' 
v2 n2 gnd dc='-10' ac='1' 
v0 vin gnd dc 0v ac 1v sin('0v' '0.5' '10k' '0s') 
xi0 gnd n0 n1 n2 vout tl082 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 10u 125m 25m
.global gnd
.param res1=1000
.param res2=4700
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end

