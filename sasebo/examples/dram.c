// A dram test program

#include <stdio.h>
#include <stdlib.h>
#include "uart.h"
#include "memory.h"
#include "trig.h"

unsigned long long lfsr64(unsigned long long d) {
  // x^64 + x^63 + x^61 + x^60 + 1
  unsigned long long bit = 
    (d >> (64-64)) ^
    (d >> (64-63)) ^
    (d >> (64-61)) ^
    (d >> (64-60)) ^
    1;
  return (d >> 1) | (bit << 63);
}

#ifdef USE_IO_SPACE
#define SYS_soft_reset 617
#define SYS_set_iobase 0x12200
#define SYS_set_membase 0x2100
extern long syscall(long num, long arg0, long arg1, long arg2);
#endif

//#define STEP_SIZE 4
#define STEP_SIZE 1024*16
//#define VERIFY_DISTANCE 2
#define VERIFY_DISTANCE 16


int main() {
  unsigned long waddr = 0;
  unsigned long raddr = 0;
  unsigned long long wkey = 0;
  unsigned long long rkey = 0;
  unsigned int i = 0;
  unsigned int error_cnt = 0;
  unsigned distance = 0;

  uart_init();
  trig_init();
  printf("DRAM test program.\n");
int i1=0;
while(i1<500){
		for(i=0;i<1000000;i++);
	trig_high();
		for(i=0;i<1000000;i++);
	trig_low();
	i1++;
	}
#ifdef USE_IO_SPACE
  // map DDR3 to IO
  syscall(SYS_set_membase, 0x0, 0x3fffffff, 0x0); /* BRAM, 0x00000000 - 0x3fffffff */
  syscall(SYS_set_membase+5, 0, 0, 0);            /* update memory space */

  syscall(SYS_set_iobase, 0x80000000, 0x7fffffff, 0);   /* IO devices, 0x80000000 - 0xffffffff */
  syscall(SYS_set_iobase+1, 0x40000000, 0x7ffffff, 0); /* DDR3, 0x40000000 - 0x7fffffff */
  syscall(SYS_set_iobase+5, 0, 0, 0);                   /* update io space */
#endif

  while(1) {
    printf("Write block @%lx using key %llx\n", waddr, wkey);
    for(i=0; i<STEP_SIZE; i++) {
      *(get_ddr_base() + waddr) = wkey;
      waddr = (waddr + 1) & 0x3ffffff;
      wkey = lfsr64(wkey);
    }
    
    if(distance < VERIFY_DISTANCE) distance++;

    if(distance == VERIFY_DISTANCE) {
      printf("Check block @%lx using key %llx\n", raddr, rkey);
      for(i=0; i<STEP_SIZE; i++) {
        unsigned long long rd = *(get_ddr_base() + raddr);
        if(rkey != rd) {
          printf("Error! key %llx stored @%lx does not match with %llx\n", rd, raddr, rkey);
          error_cnt++;
	 while(1){
		for(i=0;i<10000000;i++);
		trig_high();
		for(i=0;i<10000000;i++);
		trig_low();
		//i++;
		}

          exit(1);
        }
        raddr = (raddr + 1) & 0x3ffffff;
        rkey = lfsr64(rkey);
        if(error_cnt > 10) exit(1);
      }
    }
  }
}

