***** Spice Netlist for Cell 'Lab7_prelab_sue' *****

************** Module Lab7_prelab_sue **************
x0 n4 n3 n5 irfl110 
d0 n4 vc 1n4004rl 
v1 n1 gnd dc='12' ac='1' 
r2 n1 n0 4.89 noisy=0
l0 n4 n0 1mh 
r3 n2 n3 50 noisy=0
r0 gnd n5 1 noisy=0
c0 gnd vc 10uf ic=0
r1 gnd vc 497 noisy=0
v0 n2 gnd ac 0v pulse 0v 5v 0ns 1ns 1ns 19.9us 36.4us 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 1e-9 50e-6
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end

