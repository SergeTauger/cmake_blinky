#if BTR_X86 > 0
#include "x86/basic_lib.h"
#elif BTR_AVR > 0
#include "avr/basic_lib.h"
#endif
/*
#include basic_lib.h
*/

int main(){
	set_pin_output();
	while(1){
		toggle_led();
		delay(1);
	}
}