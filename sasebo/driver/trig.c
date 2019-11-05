// See LICENSE for license details.

#include "trig.h"

volatile uint32_t *trig_base_ptr = (uint32_t *)(TRIG_BASE);

void trig_init() { // to be implemented


}

void trig_high() {
	*(trig_base_ptr) = TRIG_HIGH;
  
}

void trig_low() {
	*(trig_base_ptr) = TRIG_LOW;
}


