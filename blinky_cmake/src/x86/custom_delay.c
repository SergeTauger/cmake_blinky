#include <time.h>
#include "basic_lib.h"

static inline void delay(double ms){
	clock_t start_time = clock();
	while (clock() < start_time + (int)ms){
	}
}