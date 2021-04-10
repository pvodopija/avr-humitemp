#ifndef TESTING_H
#define TESTING_H

#include <avr/io.h>

#define BLINK_MS 500
#define PIN13_HIGH 0b00100000

/* Registers */
#define macsREG_BIT_FLIP( reg, bit ) ( reg ^= ( uint8_t ) 1 << bit )         /* Flips a bit ( 0 - 7 ) */
// #define macsREG_BIT_SET( reg, bit ) ( reg |= ( uint8_t ) 1 << bit )
#define macsREG_BIT_CLEAR( reg, bit ) ( reg &= ~( ( uint8_t ) 1 << bit ) ) 
#define macsREG_BIT_SET( reg, bit, value ) ( value == 1 ) ? ( reg |= ( uint8_t ) 1 << bit ) : ( reg &= ~( ( uint8_t ) 1 << bit ) );

/* I/O */
// #define macsIO_BIT_SET( port, bit ) __asm__ __volatile__ ( "sbi %0, %1;":: "I" ( _SFR_IO_ADDR( port ) ), "I" ( bit ) )
// #define macsIO_BIT_CLEAR( port, bit ) __asm__ __volatile__ ( "cbi %0, %1;":: "I" ( _SFR_IO_ADDR( port ) ), "I" ( bit ) )

#define macsIO_BIT_SET( port, bit, value )   if( value == 1 )                                                                                \
                                                    __asm__ __volatile__ ( "sbi %0, %1;":: "M" ( _SFR_IO_ADDR( port ) ), "I" ( bit ) );         \
                                                else                                                                                            \
                                                    __asm__ __volatile__ ( "cbi %0, %1;":: "M" ( _SFR_IO_ADDR( port ) ), "I" ( bit ) );         

                                                
#define macsIO_BIT_GET( port, bit ) ( port & ( 1 << bit ) )

/* Interrupts */
#define macsENABLE_GLOBAL_INTERRUPTS()   __asm__ __volatile__ ( "sei" :: )
#define macsDISABLE_GLOBAL_INTERRUPTS()  __asm__ __volatile__ ( "cli" :: )
/*
#define macsATOMIC_16_BIT_IO_WRITE( reg_lower, reg_upper, value_lower, value_upper )                 \
                                                                __asm__ __volatile__ (                  \
                                                                "in r18, __SREG__ \n\t"                 \
                                                                "ldi r19, %0 \n\t"                      \
                                                                "ldi r20, %1 \n\t"                      \
                                                                "cli \n\t"                              \
                                                                "out %2, r19 \n\t"                      \
                                                                "out %3, r20 \n\t"                      \
                                                                "sei \n\t"                              \
                                                                "out __SREG__, r18 \n\t"                \
                                                                :: "M" ( value_lower ), "M" ( value_upper ),                                        \
                                                                "M" ( _SFR_IO_ADDR( reg_lower ) ), "M" ( _SFR_IO_ADDR( reg_upper ) )                \
                                                                : "r18", "r19", "r20" );
*/
#define macsENTER_CRITICAL() __asm__ __volatile__ (                                  \
                                            "in __tmp_reg__, __SREG__       \n\t"       \
                                            "push __tmp_reg__               \n\t"       \
                                            "cli                            \n\t"       \
                                            )

#define macsEXIT_CRITICAL() __asm__ __volatile__ (                                   \
                                            "pop __tmp_reg__                \n\t"       \
                                            "out __SREG__, __tmp_reg__      \n\t"       \
                                            "sei \n\t"                                  \
                                            )


/* Bits */
#define BIT0 0b00000001
#define BIT1 0b00000010
#define BIT2 0b00000100
#define BIT3 0b00001000
#define BIT4 0b00010000
#define BIT5 0b00100000
#define BIT6 0b01000000
#define BIT7 0b10000000

#define ON  1
#define OFF 0

void vTestingBlink( void );
void setup( void );

#endif