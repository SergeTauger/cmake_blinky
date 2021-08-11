# cmake_blinky
Private repo to play with crossplatform (avr, stm32, x86) compilation

The repo uses cmake-helpers (https://github.com/boltrobotics/cmake-helpers) as a build system. To build the code run make.sh. The idea is to place platfrom-dependent sources sharing a name into src/platform and then use the files in platform-agnostic code in src/common.

11.08.2021 - Currently not working with about default CMakelists from cmake-helpers example
