# Proposal for IP block development for the Efabless 2024 Chipalooza challenge

IP Block name:		High gain Operation Amplifier
Designer/Design Team:	BKIC3
Date:				March 22, 2024

## Circuit description:
The proposed circuit is high gain operation amplifier designed for SkyWater 130 nm process technology. The circuit should performance should pass the specifications shown in the following table:

| Parameter                           | Min | Typical | Max        | Unit   | Notes |
| ----------------------------------- | --- | ------- | ---------- | ------ | ----- |
| Operating Temperature               | -40 |      25 |         85 |     °C |.      |
| Load Resistance                     |.  5 |.        |            |   kOhm |.      |
| Load Capacitance                    |.    |         |         30 |     pF |       |
| Total Harmonic Distortion.          |     |     --- |        --- |      % | At nominal output power |
| Signal-to-Noise Ratio               |  ---|     --- |.       --- |.    dB | |
| Output Voltage Swing                | 100 |.        |       4910 |     mV |At 5 kOhms maximum load |
| Output Voltage Swing.               |  ---|         |        --- |     mV | At 50 kOhms load |
| Power Consumption (Enabled)         |     |         |.       --- |     mA | At 5 kOhms maximum load |
| Power Consumption (No load)         |     |         |       1020 |     uA | |
| Power Consumption (Disabled).       |     |     --- |.       --- |     nA | |
| PSRR (Power Supply Rejection Ratio) |     |     27  |            |     dB | |
| CMRR (Common mode Rejection Ratio)  |     |.    137 |.           |     dB | |
| Gain Bandwidth Product.             |     |.    15  |.           |    MHz | |
| Open loop gain                      |     |.    120 |.           |     dB |  With load 5kOhms & 30pF capacitor 
| Phase margin                        |     |.     90 |.           |      ° | |
| Wakeup time (ena transition 0 to 1) |     |     --- |.           |.    ns | |
| Common-mode input voltage           |   0 |.    --- |.      5    |      V | Rail-to-rail operation |
| Equivalent Input Noise              |     |.        |.       --- | nV/√Hz | At 4kOhms maximum load, measured at 10kHz |



## Circuit pinout:

| Pinout | Pin name | Use |
| --- | --- | --- |
| avdd | analog power | 5V |
| dvdd | digital power | 1.8V |
| avss | analog ground |GND = 0V |
| dvss | digital ground | |
| ena | enable | dvdd domain |
| ibias | bandgap-controlled current bias | 10uA |
| iptat | PTAT current bias from bandgap | |
| isel | Bias selection bit | dvdd domain | |
| vinn | negative input | |
| vinp | positive input | |
| vout | output voltage | |

If the top level designer should choose to implement an analog test bus (ATB), the circuit would require extra pins to select the internal voltage nodes to be measured. A good idea should be to add an extra pin to choose between the on-chip biasing currents and an external one. Another possibility is to add an offset voltage trimming pin, but the extra circuit will add complexity and area usage.

## Circuit architecture:
The chosen operational amplifier topology is based on the folded cascode operation amplifier , also designed for the SkyWater 130 nm process by the author of this proposal. 
![image](https://github.com/ThaoCaoChau/sky130_bkic3_ip__hgopamp/assets/118146935/a0928810-8152-40c3-a1f3-81435487270c)

External resources (if any) (all resources must be open source): Vcm = 2,5V for comon mode feedback


## Specification challenges:
The chosen topology folded is relatively easy, bt the challenges is the structure makes it difficult to achieve rail to rail at the output, and the structure needcommon mode feedback for operate stability 


## Testbenches required for verifying circuit performance:
The simulation testbenches cover mostly DC and AC performance characterization (DC gain, input and output range, power consumption, output current, bandwidth, phase margin, PSRR, CMRR, input referred noise), and transient ones (THD, slew-rate). 
The simulation testbenches for run dc operating point, AC, DC gain, input and output range, power consumption, bandwith, phase margin, PSRR, CMRR, 


## Connections required for standalone (breakout) implementation:
The actual circuit input pins should be located as close as possible to the pads. The parasitic input current is mostly composed of the ESD protection. The output current can be quite high, so extra care must be taken for the output node and the supply nets of the output stage.
Connections pin : INN, INP, VDD, GND, VCM, VON,VOP

Current consumption measurements are only possible if the circuit has a dedicated power supply pin. If the circuit is working as intended, the current consumption can be inferred by the biasing current, which certainly will be measured from the on-chip standalone current bias generator. ATB points could be inserted to measure the biasing voltages, but are not strictly necessary.

## Test plan for standalone (breakout) implementation:
The proposed circuit, an operational amplifier, can be tested in most university labs, with conventional oscilloscopes. The proposed circuit specifications do not require high speed, ultra-low-noise, and ultra-low-current measurement equipment. Detailed measurement guidelines can be found in Analog Devices tutorials , among many other references.
Describe how the standalone circuit can be measured on a lab bench to verify that the circuit meets performance requirements for each specified electrical parameter.

We setup voltage suppy for VDD & GND 
Using input source is soure generator with signal has amplitude & frequency, then measure signal in output & measure parameter. 


## References
[1] Behzad Razavi Design Of Analog Cmos Integrated Circuit , 2Nd Edition

