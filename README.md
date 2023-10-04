# logi-kvm
Logitech KVM (Keyboard Video Mouse) in software

TL;DR: This simple project is a Software-driven KVM switch. It uses a simple script to tell your monitor to switch video input, and to tell some wireless logitech mice and Keyboards to switch to another channel (eg: logitech keyboards or mice that have an EasySwitch button that let you go from Dongle 1, Dongle 2, Bluetooth).

## What you will need

(1) Two separate Logitech unifying dongles: The ones that come with your keyboard, and mouse, are should be just fine.

(2) Regular mouse and keyboard (temporarily). If you have a laptop, your built-in keyboard and trackpad are fine. If not, a regular wired keyboard/mouse is easiest. If you have neither, but your computer has bluetooth, pair your Logitech mouse and keyboard via bluetooth (This is because we'll need to unpair and re-pair your keyboard and mouse to the Logitech dongles)

## Setting up your dongles 

(1) Download and install the Logitech Unifying software.
Get it here: https://support.logi.com/hc/en-us/articles/360025297913-Unifying-Software

(2) Insert the first Logitech dongle.

(3) Start the application, click Advanced.

(4) Unpair all devices from your unifying dongle.

(5) Using the EasySwitch buttons, put mice and keyboard on channel 1.

(6) Re-Pair your Keyboard first (by turning it off-and-on). Re-Pair your Mouse second (also off-and-on). (this corresponds to the pairing order in the script, aka: KPAIR=0x01 and MPAIR=0x02)

(7) Remove the dongle, insert other dongle.

(8) Unpair all devices from the dongle.

(9) Using the EasySwitch buttons, put mice and keyboard on channel 2.

(10) Re-Pair your Keyboard First, and Mouse second.

(11) Take one dongle and put it in the other computer's USB port.

(12) Verify that you can control both computers using both dongles, by using the keyboard's and mouse's easyswitch buttons (channel 1 and 2).

(13) If not using a laptop, disconnect your wired keyboard/mouse, or unpair the bluetooth connection.


## Installing the KVM scripts 

Note: this script was derived from the work of Marcel Hoffs (https://github.com/marcelhoffs/input-switcher) -- refer to this repo for more details.

Install the contents of this repo in a folder somewhere, eg: c:\program files\softkvm

Edit softkvm-switch.bat 

(1) Edit the hardware IDs of your mouse and keyboard. Finding the hardware Ids is the most difficult part of this process. I followed the instructions using Solaar, as per Marcel Hoff's instructions, but it requires running Solaar under Linux. If you don't have Linux, install Ubuntu Linux on a USB Key and then install Solaar (apt-get install Solaar).

(2) Edit the device IDs of your video inputs. You can do this by running "winddcutil.exe capabilities 1" at the command prompt, and looking at the response string and figuring out which is which. You may need to experiment a bit.

(3) Select your switch's direction. Once you have found the IDs of your logitech devices and video inputs, it's just a matter of editing the KTOCHANNEL, MTOCHANNEL, MONITORID variables in the script to select which way the script will go to.

(4) Copy your installation to computer 2, and modify the KTOCHANNEL, MTOCHANNEL, MONITORID variables to point back to computer 1.


## Make a shortcut in the Windows Taskbar 

(1) Create a shortcut, point to the script. In the target field, type: "cmd.exe /c "C:\Program Files\Softkvm\softkvm-switch.bat"

(2) Save the shortcut, drag the shortcut into the taskbar.

(3) Repeat the process on the other computer.

Alternatively, you can assign the launch of the batch file to a hotkey, using LogiOptions software.  I used the calculator button on my K860 to launch the script to toggle between both  computers.


## A note about the exe files in this repo 

HidAPITester.exe and WinDDCUtil.exe are both github project and can be downloaded from there. I have included them here for convenience.

## Limitations
Apparently, some monitors don't respond correctly to WinDDCUtil's input switcher commands. 
See here if your monitor is affected: https://www.ddcutil.com/monitor_notes/

Obviouysly, there's no way to switch USB devices like a webcam or headset. For this you'll need a real KVM hardware switch.

## References:

https://github.com/todbot/hidapitester/releases

https://github.com/scottaxcell/winddcutil/releases

https://github.com/marcelhoffs/input-switcher

