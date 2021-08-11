#include <avr/delay.h>
#include "basic_lib.h"

static inline void delay(double ms){
	_delay_ms(ms);
}