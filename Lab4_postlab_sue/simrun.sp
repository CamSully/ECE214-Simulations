***** Spice Netlist for Cell 'Lab4_postlab_sue' *****

************** Module Lab4_postlab_sue **************
r0 vin n0 1k noisy=0
xi0 gnd n0 n1 n2 vout tl082 
v1 n1 gnd dc='10' ac='1' 
r1 n0 vout 1meg noisy=0
c0 vout n0 0.1u ic=0
v2 n2 gnd dc='-10' ac='1' 
v0 vin gnd ac 0v pulse -1v 1v 0ns 0.1us 0.1us 0.5ms 1ms 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 10u 125m 25m
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end

