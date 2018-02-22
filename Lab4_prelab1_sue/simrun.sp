***** Spice Netlist for Cell 'Lab4_prelab1_sue' *****

************** Module Lab4_prelab1_sue **************
r0 vin n0 res1 noisy=0
r1 n0 vout res2 noisy=0
v2 n2 gnd dc='-10' ac='0' 
v1 n1 gnd dc='10' ac='0' 
v0 vin gnd dc 0v ac 1v sin('0v' '0.5' '40k' '0s') 
xi0 gnd n0 n1 n2 vout tl082 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.ac dec 200 100 1e6
.global gnd
.param res1=1000
.param res2=4700
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end

