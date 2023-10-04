@echo off 

rem -- This script was built as a software KVM for the following devices:
rem --
rem -- Logitech MX Master 3 (mouse)
rem -- Logitech ERGO K860 (keyboard)
rem -- LG 34UC98W monitor (2016)

rem -- It should work for most Logitech devices that have the EasySwitch feature.
rem -- It's possible that some monitors may have problems switching inputs. YMMV.


rem -- IDENTIFY LOGITECH EASYSWITCH CHANNELS
rem ----------------------------------------
set UNIFYING1=0x00
set UNIFYING2=0x01
set UNIFYINGBT=0x02


rem -- KEYBOARD SETTINGS
rem -------------------
rem -- When using the "Logitech Unifying Software", look at the list of paired devices. KPAIR is the position of the Keyboard (index starts at 1)
rem -- KID1 and KID2 are the Device ID of the Keyboard. For a K860, that device ID is 0x091E so 0x09, 0x1E

set KPAIR=0x01
set KID1=0x09
set KID2=0x1e
set KTOCHANNEL=%UNIFYING2%


rem -- MOUSE SETTINGS
rem -------------------
rem -- When using the "Logitech Unifying Software", look at the list of paired devices. MPAIR is the position of the Mouse (index starts at 1)
rem -- KID1 and KID2 are the Device ID of the Keyboard. For a "MX Master 3" mouse, that device ID is 0x0A1C so 0x0A, 0x1C

set MPAIR=0x02
set MID1=0x0A
set MID2=0x1C
set MTOCHANNEL=%UNIFYING2%



rem -- MONITOR SETTINGS
rem -------------------
rem -- Here we get the list of Internal Monitor Ids. You can get this list from calling: 
rem -- "winddcutil.exe capabilities 1" 
rem -- and look for the list of numbers in parenthesis next to the 60.  Ex:  "60(11 12 0F 10)"

set HDMI1=0x11
set HDMI2=0x12
set DISPLAYPORT1=0x0F
set THUNDERBOLT1=0x10

set MONITORID=%HDMI2%

rem Switch Keyboard
.\hidapitester.exe --vidpid 046D:C52B --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,%KPAIR%,%KID1%,%KID2%,%KTOCHANNEL%,0x00,0x00 >nul

rem Switch Display (provides delay to execute previous command)
.\winddcutil.exe setvcp 1 0x60 %MONITORID% >nul

rem Switch Mouse
.\hidapitester.exe --vidpid 046D:C52B --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,%MPAIR%,%MID1%,%MID2%,%MTOCHANNEL%,0x00,0x00 >nul

