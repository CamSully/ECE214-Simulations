***** Spice Netlist for Cell 'Lab7_prelab_sue' *****

************** Module Lab7_prelab_sue **************
x0 n4 n2 n5 irfl110 
d0 n4 vc 1n4004rl 
l0 n4 n0 1mh 
r3 n3 n2 50 noisy=0
r0 gnd n5 1 noisy=0
c0 n8 vc 10uf ic=0
v1 n1 gnd dc='12' ac='0' 
r1 n7 vc 510 noisy=0
v0 n3 gnd ac 0v pulse 0v 5v 0ns 0 0 22.545us 36.36us 
r2 n1 n0 4.89 noisy=0
r4 n6 vc 510 noisy=0
r5 gnd n6 510 noisy=0
r6 gnd n7 510 noisy=0
r7 vc vout 11k noisy=0
c1 gnd vout 1.5nf ic=0
r8 gnd n8 2 noisy=0





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 100e-9 6e-3 1e-3
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end

