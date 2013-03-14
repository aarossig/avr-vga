EESchema Schematic File Version 2  date Thu 14 Mar 2013 12:04:53 PM EDT
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 43  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title ""
Date "14 mar 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3700 3950 3950 3950
Wire Notes Line
	5800 2850 4800 2850
Wire Notes Line
	5800 2850 5800 4050
Wire Notes Line
	5800 4050 4800 4050
Wire Notes Line
	4800 4050 4800 2850
Connection ~ 4550 3250
Wire Wire Line
	4450 3250 5200 3250
Wire Wire Line
	5200 3250 5200 3350
Wire Wire Line
	4450 3950 4550 3950
Wire Wire Line
	4550 3850 4550 4050
Connection ~ 4550 3950
Wire Wire Line
	4550 3250 4550 3350
Wire Wire Line
	4550 4550 4550 4650
Wire Wire Line
	5200 3850 5200 3950
Wire Wire Line
	3700 3250 3950 3250
$Comp
L CONN_1 P1
U 1 1 51412798
P 3550 3950
F 0 "P1" H 3630 3950 40  0000 L CNN
F 1 "CONN_1" H 3550 4005 30  0001 C CNN
	1    3550 3950
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P0
U 1 1 5141278D
P 3550 3250
F 0 "P0" H 3630 3250 40  0000 L CNN
F 1 "CONN_1" H 3550 3305 30  0001 C CNN
	1    3550 3250
	-1   0    0    1   
$EndComp
Text Label 4800 2850 0    60   ~ 0
Inside the Monitor
Text Label 5200 3250 0    60   ~ 0
VGA Red
$Comp
L GND #PWR2
U 1 1 514126FB
P 5200 3950
F 0 "#PWR2" H 5200 3950 30  0001 C CNN
F 1 "GND" H 5200 3880 30  0001 C CNN
	1    5200 3950
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 514126EB
P 5200 3600
F 0 "R5" V 5280 3600 50  0000 C CNN
F 1 "75" V 5200 3600 50  0000 C CNN
	1    5200 3600
	1    0    0    -1  
$EndComp
Text Label 3700 3950 0    60   ~ 0
Red 0
Text Label 3700 3250 0    60   ~ 0
Red 1
$Comp
L GND #PWR1
U 1 1 514126AD
P 4550 4650
F 0 "#PWR1" H 4550 4650 30  0001 C CNN
F 1 "GND" H 4550 4580 30  0001 C CNN
	1    4550 4650
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 514125E0
P 4550 4300
F 0 "R4" V 4630 4300 50  0000 C CNN
F 1 "221" V 4550 4300 50  0000 C CNN
	1    4550 4300
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 514125D9
P 4550 3600
F 0 "R3" V 4630 3600 50  0000 C CNN
F 1 "221" V 4550 3600 50  0000 C CNN
	1    4550 3600
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 514125D0
P 4200 3950
F 0 "R2" V 4280 3950 50  0000 C CNN
F 1 "442" V 4200 3950 50  0000 C CNN
	1    4200 3950
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 514125C2
P 4200 3250
F 0 "R1" V 4280 3250 50  0000 C CNN
F 1 "442" V 4200 3250 50  0000 C CNN
	1    4200 3250
	0    1    1    0   
$EndComp
$EndSCHEMATC
