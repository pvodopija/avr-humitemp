/* 
Adding support for MCUs Analog to Digital Converter ( ADC ). For now only single conversion mode.
Here are some important registers we need to work with:

ADMUX ( ADC MultiplexerSelect ) -> 4 least significant bits go through the MUX decoder and select the input pin we are reading from. We can also select voltage reference.
ADCSRA ( ADC CTRL and Status Register ) ->
ADCH/ADCL ( ADC Data Register  ) -> Right adjusted by default. Change adcUSE_LEFT_ADJUSTED macro to 1 if you want left adjusted result.

For more information on the specific bits and registers visit section 23 - Analog Conversion in the datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf
*/

#ifndef ADC_H
#define ADC_H

#include <avr/io.h>
#include "../testing.h"

/* Input codes that go through the MUX decoder. */
#define ADC0 0b00000000
#define ADC1 0b00000001
#define ADC2 0b00000010
#define ADC3 0b00000011
#define ADC4 0b00000100
#define ADC5 0b00000101
#define ADC6 0b00000110
#define ADC7 0b00000111 
#define ADC8 0b00001000
#define V_BG 0b00001110 /* Internal Reference, 1.1V. */
#define GND  0b00001111 /* Ground, 0V. */

/* Configs */
#define adcUSE_LEFT_ADJUSTED        0
#define adcUSE_INTERNAL_REFERENCE   0

#define adcENABLE() testingREG_BIT_SET( ADCSRA, ADEN, ON );   /* Turns on the ADC. An empty read should be performed since it initializes the ADC and lasts a bit longer ( 25 cycles instead of normal 13 ). */
#define adcDISABLE() testingREG_BIT_SET( ADCSRA, ADEN, OFF );  /* Turns off the ADC, should be used in Power-Saving modes. */


static uint16_t uiAdcRead( uint8_t uiAdcInput )
{
    ADMUX = ( ADMUX & 0b11110000 ) | uiAdcInput;    /* Clears the previous input code and sets appropriate input pin. */ 

    testingREG_BIT_SET( ADCSRA, ADSC, ON );         /* Start conversion. */

    while( ADCSRA & ( 0x01 << ADSC ) );     /* Waiting for the ADSC bit to go back to zero which means the conversion has finished. Only then can we read the value from the data register. */
    
    uint16_t uiData;
    # if ( adcUSE_LEFT_ADJUSTED == 0 )
    {
        __asm__ __volatile__ (
            "lds %A0, 0x78 \n\t"
            "lds %B0, 0x79 \n\t"
            : "=r" ( uiData )
            : "M" ( &ADCL ), "M" ( &ADCH )
        );
    }
    # else
        uiData = 0x0; /* TODO: Implement this. */
    #endif
    
    return uiData;
}


static void vAdcInit()
{
    #if ( adcUSE_LEFT_ADJUSTED == 1 )
        testingREG_BIT_SET( ADMUX, ADLAR, ON );
    #endif

    #if ( adcUSE_INTERNAL_REFERENCE == 1 )
        ADMUX |= 0b11000000;
    #else
        testingREG_BIT_SET( ADMUX, REFS0, ON );
    #endif

    adcENABLE();
    ADCSRA &= ~0x01;    /* Setting ADC clock prescalar to 64. */
    uiAdcRead( ADC0 );
    
}

#endif