***** Spice Netlist for Cell 'Lab4_prelab2_sue' *****

************** Module Lab4_prelab2_sue **************
r2 n3 n2 10k noisy=0
r3 n2 gnd 10k noisy=0
v1 n3 gnd dc='10' ac='0' 
v0 vin gnd dc='1' ac='0' 
v2 n0 gnd dc='10' ac='0' 
r1 n1 vout 10k noisy=0
r0 vin n1 4k noisy=0
xi0 n1 n2 n0 gnd vout tl082 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.dc V0 10 0 -.1
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end

