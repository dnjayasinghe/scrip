// See LICENSE for license details.

#include "aesio.h"



volatile uint32_t *aesio_base_ptr = (uint32_t *)(AESIO_BASE);

void aesio_kvld_HIGH() {
	*(aesio_base_ptr+AESIO_KVLD) = AESIO_TRIG_HIGH;
  
}

void aesio_kvld_LOW() {
	*(aesio_base_ptr+AESIO_KVLD) = AESIO_TRIG_LOW;
  
}

void aesio_dvld_HIGH() {
	*(aesio_base_ptr+AESIO_DVLD) = AESIO_TRIG_HIGH;
  
}

void aesio_dvld_LOW() {
	*(aesio_base_ptr+AESIO_DVLD) = AESIO_TRIG_LOW;
  
}

 void aesio_dready(){
	int i=1;
	while(i){
		if((*((volatile unsigned int *)(aesio_base_ptr + AESIO_DRDY))&0x000000FF)==0x00000001)
			i=0;	
	}

}

void aesio_kready(){
	int i=1;
	while(i){
		if((*((volatile unsigned int *)(aesio_base_ptr + AESIO_KRDY))&0x000000FF)==0x00000001)
			i=0;	
	}

}


