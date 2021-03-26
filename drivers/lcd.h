/* 
    Simple LCD1602 ( HD44780U ) interface driver. It sucks that we can't use the whole PORTD as the data bus since the first two bits are for the stupid serial communication.
    That means we cant use any of the I/O ports as a whole for 8-bit data transmission because of its  architecture.
    So I'll be using PORTD ( 2 ... 7 ) and PORTB ( 0, 1 ) as an 8-bit data bus, and PORTB ( 2, 3, 4 )  for display commands.
    PORTB2 -> RS    ( Register Select - Instruction Register -> 0, Data Register -> 1. )
    PORTB3 -> R/W   ( Read or Write operation. Write -> 0 , Read -> 1. )
    PORTB4 -> E     ( Enable Bit, actually executes. )
 */
#ifndef LCD_H
#define LCD_H

#include <avr/io.h>
#include <string.h>
#include "../testing.h"

#ifndef F_CPU
#define F_CPU 16000000UL
#endif

#include <util/delay.h>

#define lcdDISPLAY_CLEAR            0b00000001
#define lcdDEFAULT_MODE             0b00111000      /* 8-bit mode, 2-line display, 5x8 font. */
#define lcdNO_CURSOR_MODE           0b00001100      /* Display ON, Cursor OFF, Cursor-blinking OFF. */
#define lcdCURSOR_MODE              0b00001111      /* Display ON, Cursor ON, Cursor-blinking ON. */
#define lcdDEFAULT_ENTRY_MODE       0b00000110      /* Increment address counter, no shift. */
#define lcdNEW_LINE                 0b11000000      /*  */

#define lcdINSTRUCTION  0
#define lcdDATA         1

#define lcdSEND( byte, type )                                           \
{                                                                       \
    PORTD = 0x00;                                                       \
    PORTD |= ( byte << 2 );               /* First 6 bits of data. */   \
    PORTB &= 0b11111100;                                                \
                                                                        \
    /* Following block should extract highest two bits from data and store them at PORTB0/1 without corrupting the whole port. */   \
    __asm__ __volatile__ (                  \
        "swap %0                 \n\t"      \
        "lsr %0                  \n\t"      \
        "lsr %0                  \n\t"      \
        "in r18, %1              \n\t"      \
        "or %0, r18              \n\t"      \
        "out %1, %0              \n\t"      \
        ::"a" ( byte & 0b11000000 ), "M" ( _SFR_IO_ADDR( PORTB ) )      \
        :"r18"                                                          \
    );                                                                  \
                                                                        \
    testingIO_BIT_SET( PORTB, 2, type );        /* Set RS to Data register. */      \
    testingIO_BIT_SET( PORTB, 3, OFF );         /* R/W to Write. */                 \
                                                                                    \
    /* Signal the enable bit. */                                                    \
    testingIO_BIT_SET( PORTB, 4, ON );                                              \
    testingIO_BIT_SET( PORTB, 4, OFF );                                             \
    _delay_ms( 1 ); /* We delay since MCU is much faster than the LCD interface. */ \
}

#define lcdCLEAR_DISPLAY() lcdSEND( lcdDISPLAY_CLEAR, lcdINSTRUCTION )

static void vLcdInstruction( uint8_t ucInstruction )    { lcdSEND( ucInstruction, lcdINSTRUCTION ); }
static void vLcdPrintChar( uint8_t ucChar )             { if( ucChar == '\n' ) { lcdSEND( lcdNEW_LINE, lcdINSTRUCTION ); } else { lcdSEND( ucChar, lcdDATA ); } }

static inline void vLcdPrint( char* pcString )
{
    for( uint8_t i = 0; pcString[i] != '\0'; i++ )
    {
        vLcdPrintChar( ( uint8_t ) pcString[i] );
    }
}

void vLcdPrintNumber( int16_t iNum );

static inline void vLcdInit( void )
{
    /* Set pins on PORTD as output as well as first 5 pins on PORTB. */
    DDRD |= 0b11111100;      
    DDRB |= 0b00011111;

    testingIO_BIT_SET( PORTB, 2, OFF );     /* Clear RS. */
    testingIO_BIT_SET( PORTB, 3, OFF );     /* R/W to Write. */
    testingIO_BIT_SET( PORTB, 4, OFF );     /* Clear Enable. */
    
    vLcdInstruction( lcdDEFAULT_MODE );
    vLcdInstruction( lcdNO_CURSOR_MODE );
    lcdCLEAR_DISPLAY();
    
    _delay_ms( 10 );
}

#endif