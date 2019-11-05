// A hello world program

#include <stdio.h>
#include "uart.h"
#include "trig.h"
#include "aesio.h"
#include "aes.h"

#define ECB 1

volatile uint32_t *aesio_base_ptr1 = (uint32_t *)(AESIO_BASE);


int main() {
  uart_init();
  trig_init();
int i=0;
uint32_t kin_1 , kin_2 , kin_3 , kin_4;
uint32_t din_1 , din_2 , din_3 , din_4;
uint32_t dout_1, dout_2, dout_3, dout_4;

uint8_t key[16] =        { (uint8_t) 0x2b, (uint8_t) 0x7e, (uint8_t) 0x15, (uint8_t) 0x16, (uint8_t) 0x28, (uint8_t) 0xae, (uint8_t) 0xd2, (uint8_t) 0xa6, (uint8_t) 0xab, (uint8_t) 0xf7, (uint8_t) 0x15, (uint8_t) 0x88, (uint8_t) 0x09, (uint8_t) 0xcf, (uint8_t) 0x4f, (uint8_t) 0x3c };

uint8_t pt[16] =        { (uint8_t) 0x2b, (uint8_t) 0x7e, (uint8_t) 0x15, (uint8_t) 0x16, (uint8_t) 0x28, (uint8_t) 0xae, (uint8_t) 0xd2, (uint8_t) 0xa6, (uint8_t) 0xab, (uint8_t) 0xf7, (uint8_t) 0x15, (uint8_t) 0x88, (uint8_t) 0x09, (uint8_t) 0xcf, (uint8_t) 0x4f, (uint8_t) 0x3c };

uint8_t ct[16] =        { (uint8_t) 0x2b, (uint8_t) 0x7e, (uint8_t) 0x15, (uint8_t) 0x16, (uint8_t) 0x28, (uint8_t) 0xae, (uint8_t) 0xd2, (uint8_t) 0xa6, (uint8_t) 0xab, (uint8_t) 0xf7, (uint8_t) 0x15, (uint8_t) 0x88, (uint8_t) 0x09, (uint8_t) 0xcf, (uint8_t) 0x4f, (uint8_t) 0x3c };

struct AES_ctx ctx;




while(1){


aesio_kready();

aesio_kvld_HIGH();
aesio_kvld_LOW();

kin_1=((*(volatile unsigned int *)(aesio_base_ptr1 + AESIO_KIN+0)));
kin_2=((*(volatile unsigned int *)(aesio_base_ptr1 + AESIO_KIN+1)));
kin_3=((*(volatile unsigned int *)(aesio_base_ptr1 + AESIO_KIN+2)));
kin_4=((*(volatile unsigned int *)(aesio_base_ptr1 + AESIO_KIN+3)));


for(i=0;i<4;i++){
key[0+i]=(kin_1>>8*(3-i)) & 0xFF;
key[4+i]=(kin_2>>8*(3-i)) & 0xFF;
key[8+i]=(kin_3>>8*(3-i)) & 0xFF;
key[12+i]=(kin_4>>8*(3-i)) & 0xFF;
}

AES_init_ctx(&ctx, key);

//for(i=0;i<100000;i++);
aesio_dready();
//aesio_kvld_LOW();

din_1=((*(volatile unsigned int *)(aesio_base_ptr1 + AESIO_DIN+0)));
din_2=((*(volatile unsigned int *)(aesio_base_ptr1 + AESIO_DIN+1)));
din_3=((*(volatile unsigned int *)(aesio_base_ptr1 + AESIO_DIN+2)));
din_4=((*(volatile unsigned int *)(aesio_base_ptr1 + AESIO_DIN+3)));
for(i=0;i<4;i++){
pt[0+i]=(din_1>>8*(3-i)) & 0xFF;
pt[4+i]=(din_2>>8*(3-i)) & 0xFF;
pt[8+i]=(din_3>>8*(3-i)) & 0xFF;
pt[12+i]=(din_4>>8*(3-i)) & 0xFF;
}
trig_high();
AES_ECB_encrypt(&ctx, pt);
trig_low();

dout_1 = (pt[0]<<24)| (pt[1]<<16) | (pt[2]<<8)| (pt[3]<<0);
dout_2 = (pt[4]<<24)| (pt[5]<<16) | (pt[6]<<8)| (pt[7]<<0);
dout_3 = (pt[8]<<24)| (pt[9]<<16) | (pt[10]<<8)| (pt[11]<<0);
dout_4 = (pt[12]<<24)| (pt[13]<<16) | (pt[14]<<8)| (pt[15]<<0);

*(volatile uint32_t *)(aesio_base_ptr1+AESIO_DOUT+0x0U) = dout_1;
*(volatile uint32_t *)(aesio_base_ptr1+AESIO_DOUT+0x1U) = dout_2;
*(volatile uint32_t *)(aesio_base_ptr1+AESIO_DOUT+0x2U) = dout_3;
*(volatile uint32_t *)(aesio_base_ptr1+AESIO_DOUT+0x3U) = dout_4;
aesio_dvld_HIGH();
aesio_dvld_LOW();


//for(i=0;i<10000;i++);

}

  printf("Hello World!\n");
}

