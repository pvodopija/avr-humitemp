#ifndef POWER_H
#define POWER_H

#include <avr/io.h>
#include "../macs.h"

#define IDLE_MODE               0
#define ADC_NR_MODE             2
#define POWER_DOWN_MODE         4
#define POWER_SAVE_MODE         6
#define STANDBY_MODE            12
#define EXTERNAL_STANDBY_MODE   14

#define powerSLEEP( mode )                              \
{                                                       \
    SMCR = mode | ( 0x01 );     /* 0x01 for SE bit. */  \
    __asm__ __volatile__ ( "sleep\n\t" );               \
}

#endif