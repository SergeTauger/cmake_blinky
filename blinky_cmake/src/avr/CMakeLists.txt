cmake_minimum_required(VERSION 3.16)
project(blinky)

set(AVR_MCU atmega328p PARENT_SCOPE)
#set(AVR_L_FUSE 0xFF) #This fuses are default
#set(AVR_H_FUSE 0xDE)
#set(AVR_E_FUSE 0x05)
set(MCU_SPEED "16000000UL" PARENT_SCOPE)
set(AVR_UPLOADTOOL avrdude PARENT_SCOPE)
set(AVR_UPLOADTOOL_PORT usb PARENT_SCOPE)
set(AVR_PROGRAMMER usbasp PARENT_SCOPE)

include(avr_project)
setup_avr()
find_srcs()
build_exe(SRCS ${SOURCES})