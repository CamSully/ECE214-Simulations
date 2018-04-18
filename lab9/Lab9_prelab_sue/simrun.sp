***** Spice Netlist for Cell 'Lab9_prelab_sue' *****

************** Module Lab9_prelab_sue **************
r0 gnd vout 10k noisy=0
xi0 n0 n1 Multivibrator_sue
xi1 n0 n1 vout Boost_Converter_sue
v0 n0 gnd dc='12' ac='0' 

************** Module Multivibrator_sue **************
.subckt Multivibrator_sue dc_in vout
r0 n0 dc_in 1k noisy=0
r1 vout dc_in 1k noisy=0
r2 vc2 dc_in 60k noisy=0
r3 gnd vc2 30k noisy=0
r4 vc1 dc_in 60k noisy=0
r5 gnd vc1 30k noisy=0
x0 vout vc2 gnd 2n7000_mod 
x1 n0 vc1 gnd 2n7000_mod 
c0 n0 vc2 1.56nf ic=0
c1 vc1 vout 0.51nf ic=0
.ends Multivibrator_sue

************** Module Boost_Converter_sue **************
.subckt Boost_Converter_sue dc_in fg_in vout
x0 n1 fg_in n2 irfl110 
d0 n1 vout 1n4004rl 
l0 n1 n0 1mh 
r1 gnd n2 1 noisy=0
c0 gnd vout 10uf ic=0
r2 n4 vout 510 noisy=0
r3 dc_in n0 4.89 noisy=0
r4 n3 vout 510 noisy=0
r5 gnd n3 510 noisy=0
r6 gnd n4 510 noisy=0
.ends Boost_Converter_sue





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 100e-4 250e-3 100e-3
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op
.ic v(xi0.vc1) = 0

.end

