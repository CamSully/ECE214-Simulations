***** Spice Netlist for Cell 'Lab6_prelab_sue' *****

************** Module Lab6_prelab_sue **************
v0 n0 gnd dc 0v ac 1v sin('0v' '1v' '1k' '0s') 
r1 n0 vin 50 noisy=0
r2 vin n1 0 noisy=0
c0 gnd n2 0.33uf ic=0
r0 n2 vc 0 noisy=0
l0 vc n1 1mh 





.ac dec 201 1e3 500e3

.end
