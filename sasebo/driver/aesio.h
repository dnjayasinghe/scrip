// See LICENSE for license details.


#include <stdint.h>
#include "device_map.h"


//Trigger output is JA1
			//         80030000
#define AESIO_BASE (IO_SPACE_BASE + 0x00000u)


#define AESIO_KRDY 0x18u
#define AESIO_KVLD 0x19u
#define AESIO_DRDY 0x1Au
#define AESIO_DVLD 0x1Bu

#define AESIO_KIN  0x00
#define AESIO_DIN  0x08
#define AESIO_DOUT 0x10

// Logic 1:
#define AESIO_TRIG_HIGH 0x1u

// Logic 0:
#define AESIO_TRIG_LOW 0x0u

#define KRDY  
#define KVLD
#define DRDY
#define DVLD


// Trigger APIs
extern void aesio_kvld_HIGH();
extern void aesio_kvld_LOW();
extern void aesio_dvld_HIGH() ;
extern void aesio_dvld_LOW() ;
//extern void trig_low();

extern void aesio_dready();
extern void aesio_kready();
