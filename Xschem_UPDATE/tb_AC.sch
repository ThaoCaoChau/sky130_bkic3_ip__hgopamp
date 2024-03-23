v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 330 -140 1130 260 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=10e-6
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=""
color=""
dataset=-1
unitx=1
logx=0
logy=0
}
N -220 -250 -180 -250 {
lab=INN}
N -220 -220 -180 -220 {
lab=IBIAS_5u}
N -220 -190 -180 -190 {
lab=VCM}
N -220 -160 -180 -160 {
lab=#net1}
N -220 -130 -180 -130 {
lab=INP}
N -100 -110 -100 -80 {
lab=GND}
N -20 -210 10 -210 {
lab=VOP}
N -20 -170 10 -170 {
lab=VON}
N -100 -300 -100 -270 {
lab=VDD}
N 50 -410 50 -370 {
lab=VDD}
N 50 -310 50 -270 {
lab=IBIAS_5u}
N 275 -430 275 -370 {
lab=VDD}
N 145 -430 145 -370 {
lab=INP}
N 145 -310 145 -270 {
lab=GND}
N 145 -270 275 -270 {
lab=GND}
N 275 -310 275 -270 {
lab=GND}
N 345 -430 345 -370 {
lab=VCM}
N 345 -310 345 -270 {
lab=GND}
N 345 -270 530 -270 {
lab=GND}
N 530 -420 530 -370 {
lab=INN}
N 530 -310 530 -270 {
lab=GND}
N 275 -270 345 -270 {
lab=GND}
C {/home/truong/Truong_schem/Folded_5u_sym.sym} -120 -210 0 0 {name=x1}
C {devices/isource.sym} 50 -340 0 0 {name=I0 value=5u}
C {devices/vsource.sym} 275 -340 0 0 {name=V4 value=5 savecurrent=false}
C {devices/vsource.sym} 145 -340 0 0 {name=V6 value=2.5 savecurrent=false}
C {devices/lab_pin.sym} 275 -410 0 0 {name=p22 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 145 -410 0 0 {name=p24 sig_type=std_logic lab=INP}
C {devices/vsource.sym} 345 -340 0 0 {name=V5 value=2.5 savecurrent=false}
C {devices/lab_pin.sym} 345 -410 0 0 {name=p34 sig_type=std_logic lab=VCM}
C {devices/vsource.sym} 530 -340 0 0 {name=V7 value="dc 2.5 ac 1 0"  net_name=true}
C {devices/lab_pin.sym} 530 -400 0 0 {name=p23 sig_type=std_logic lab=INN}
C {devices/lab_pin.sym} 50 -400 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -100 -290 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -220 -250 0 0 {name=p3 sig_type=std_logic lab=INN}
C {devices/lab_pin.sym} -220 -130 0 0 {name=p4 sig_type=std_logic lab=INP}
C {devices/lab_pin.sym} 50 -290 0 0 {name=p5 sig_type=std_logic lab=IBIAS_5u}
C {devices/lab_pin.sym} -220 -220 0 0 {name=p6 sig_type=std_logic lab=IBIAS_5u}
C {devices/lab_pin.sym} -215 -190 0 0 {name=p7 sig_type=std_logic lab=VCM}
C {devices/lab_pin.sym} 10 -210 2 0 {name=p29 sig_type=std_logic lab=VOP}
C {devices/lab_pin.sym} 10 -170 2 0 {name=p8 sig_type=std_logic lab=VON}
C {devices/code_shown.sym} 1250 -860 0 0 {name=NGSPICE1
only_toplevel=true
value="* this option enables mos model bin 
* selection based on W/NF instead of W
.option wnflag=1 
.option savecurrents

.control
save all

save current 
write Folded_5u.raw

*op
ac dec 10 1 1e9
  remzerovec
  write tb_AC.raw
quit 0
.endc
" }
C {devices/gnd.sym} -100 -80 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 310 -270 0 0 {name=l2 lab=GND}
