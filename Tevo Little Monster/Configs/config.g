; Configuration file for Duet WiFi (firmware version 3)
; executed by the firmware on start-up

; General preferences
G90                                                ; send absolute coordinates...
M83                                                ; ...but relative extruder moves
M550 P"TEVO LITTLE MONSTER"                        ; set printer name
M665 R157 L397.1073 B200 H503.4                    ; Set delta radius, diagonal rod length, printable radius and homed height
M666 X0 Y0 Z0                                      ; put your endstop adjustments here, or let auto calibration find them
M575 P1 S1 B57600                                  ; Enable PanelDue

; Network
;M551 P"YOURS"                                     ; set password
M552 S1                                            ; enable network
M586 P0 S1                                         ; enable HTTP
M586 P1 S0                                         ; disable FTP
M586 P2 S0                                         ; disable Telnet

; Drives
M569 P0 S0                                         ; physical drive 0 goes forwards
M569 P1 S0                                         ; physical drive 1 goes forwards
M569 P2 S0                                         ; physical drive 2 goes forwards
M569 P3 S1                                         ; physical drive 3 goes backwards
M584 X0 Y1 Z2 E3                                   ; set drive mapping
M350 X16 Y16 Z16 E16 I1                            ; configure microstepping with interpolation
;M350 X16 Y16 Z16 I1                               ; configure microstepping with interpolation
;M350 E16 I0                                       ; configure microstepping without interpolation
M92 X80.00 Y80.00 Z80.00 E410.00                   ; set steps per mm
M566 X1200.00 Y1200.00 Z1200.00 E3000.00           ; set maximum instantaneous speed changes (mm/min)
M203 X39960.00 Y39960.00 Z39960.00 E6000.00        ; set maximum speeds (mm/min)
M201 X1000.00 Y1000.00 Z1000.00 E3000.00           ; set accelerations (mm/s^2)
M906 X1800 Y1800 Z1800 E1000 I30                   ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                            ; Set idle timeout

M555 P1                                            ; Set firmware compatibility to look like RepRapFirmare

; Axis Limits
M208 Z0 S1                                         ; set minimum Z

; Endstops
M574 X2 S1 P"xstop"                                ; configure active-high endstop for low end on X via pin xstop
M574 Y2 S1 P"ystop"                                ; configure active-high endstop for low end on Y via pin ystop
M574 Z2 S1 P"zstop"                                ; configure active-high endstop for low end on Z via pin zstop

; BL-Touch
M950 S0 C"exp.heater3"                             ; create servo pin 0 for BLTouch
M558 P9 C"^zprobe.in" H5 F120 T6000                ; set Z probe type to bltouch and the dive height + speeds
;M558 H30                                          ; *** Remove this line after delta calibration has been done and new delta parameters have been saved
G31 P500 X0 Y0 Z1.571                              ; set Z probe trigger value, offset and trigger height
M557 R140 S20                                      ; define mesh grid

; Filament Sensor
M591 D0 P1 C"e0stop" S1 E200                       ; configure extruder drive 0 to use endstop
M591 D0                                            ; report filament sensor

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4607 C8.950070e-8 R4700 ; configure sensor 0 as thermistor on pin bedtemp
;M308 S0 P"bedtemp" Y"thermistor" T100000 B4138    ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                              ; create bed heater output on bedheat and map it to sensor 0
M143 H0 S140                                       ; set temperature limit for heater 0 to 150C
M307 H0 B1 S1.00                                   ; enable bang-bang mode for the bed heater and set PWM limit
M140 H0                                            ; map heated bed to heater 0

M308 S1 P"spi.cs1" Y"rtd-max31865"                 ; configure sensor 1 as PT100 thermocouple via CS pin spi.cs1
;M308 S1 P"e0temp" Y"thermistor" T100000 B4725      ; configure sensor 1 as standard thermistor
M950 H1 C"e0heat" T1                               ; create nozzle heater output on e0heat and map it to sensor 1
M143 H1 S400                                       ; set temperature limit for heater 1 to 400C
M307 H1 B0 S1.00                                   ; disable bang-bang mode for heater  and set PWM limit
M302 S140 R140                                     ; set minimum extrusion and retraction temps 

; Fans
M950 F0 C"fan0" Q500                               ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                     ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                               ; create fan 1 on pin fan1 and set its frequency
M106 P1 S1 H1 T45                                  ; set fan 1 value. Thermostatic control is turned on


; Tools
M563 P0 S"Main" D0 H1 F0                           ; define tool 0
G10 P0 X0 Y0 Z0                                    ; set tool 0 axis offsets
G10 P0 R0 S0                                       ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
M501                                               ; load saved parameters from non-volatile memory
M911 S20 R22 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; set voltage thresholds and actions to run on power loss

