// See LICENSE for license details.


#include <stdint.h>
#include "device_map.h"


//Trigger output is JA1


#define TRIG_BASE (IO_SPACE_BASE + 0x30000u)
// Logic 1 and LED ON:
#define TRIG_HIGH 0xfu

// Logic 0 and LED OFF:
#define TRIG_LOW 0x0u

// Trigger APIs
extern void trig_init();
extern void trig_high();
extern void trig_low();

