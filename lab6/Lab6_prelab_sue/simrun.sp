***** Spice Netlist for Cell 'Lab6_prelab_sue' *****

************** Module Lab6_prelab_sue **************
r1 vfg vin 50 noisy=0
r2 vin n0 0 noisy=0
c0 gnd n1 0.33uf ic=0
r0 n1 vc 0 noisy=0
l0 vc n0 1mh 
v0 vfg gnd dc 0v ac 1v sin('0v' '1v' '1k' '0s') 





.ac dec 201 1e3 500e3

.end

