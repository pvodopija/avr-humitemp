#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdbool.h>

#ifndef F_CPU
#define F_CPU 16000000UL
#endif

#include <util/delay.h>

#include "macs.h"
#include "drivers/lcd.h"
#include "drivers/adc.h"
#include "drivers/dht11.h"

volatile uint8_t ucINT0_FLAG = 0;

int main( void )
{    
    setup();

    for( ;; )
    {
        lcdCLEAR_DISPLAY();
        int8_t iErrorCode = iDhtRead( &PINB, 5 );
        
        if( iErrorCode == -ECONCT )
        {
            vLcdPrint( "ECONCT" );
        }
        else if( iErrorCode == -ETRANS )
        {
            vLcdPrint( "ETRANS" );
        }
        else if( iErrorCode == -ECHKSUM )
        {
            vLcdPrint( "ECHKSUM" );
        }
        else if( iErrorCode == OK )
        {
            vLcdPrint( "Humi: " );
            vLcdPrintNumber( xDhtData.uiHumidityIntegral );
            vLcdPrintChar( '.' );
            vLcdPrintNumber( xDhtData.uiHumidityDecimal );
            vLcdPrint( "%\nTemp: " );
            vLcdPrintNumber( xDhtData.uiTemperatureIntegral );
            vLcdPrintChar( '.' );
            vLcdPrintNumber( xDhtData.uiTemperatureDecimal );
            vLcdPrint( "\xdf""C" );
        }
        
        _delay_ms( 10000 );
    }

    return 0;
}

void setup( void )
{
    /* Setting direction register for input and output. */
    // macsIO_BIT_SET( DDRD, 2, OFF );                        /* D2 INPUT */
    // macsIO_BIT_SET( DDRD, 4, ON );                         /* D4 OUTPUT */

    // macsIO_BIT_SET( avr, 2, ON );                        /* Activating pull-up resistor on pin D2. */
    // macsIO_BIT_SET( DDRC, 0, OFF );
    // macsIO_BIT_SET( PORTC, 0, OFF );

    /* Any logical change on INT0 generates an interrupt request ( ISC0 mode 01 ). */
    // macsREG_BIT_SET( EICRA, 0, OFF );
    // macsREG_BIT_SET( EICRA, 1, ON );
    
    // macsREG_BIT_SET( EIMSK, 0, ON );                       /* Enable INT0 external interrupt. */
    
    vLcdInit( lcdDEFAULT_MODE );
    vLcdPrint( "Initializing..." );
    vAdcInit();
    _delay_ms( 2000 );

    // /* Setting up the timer ( TCNT1, OCCR1, TCCRA/B ). */
    // TCCR1A = 0x00;

    // macsREG_BIT_SET( TCCR1B, 3, ON ); /* Enabling CTC mode. */

    // /* Setting timer prescalar to 256 ( lower three bits = 100 ). */
    // macsREG_BIT_SET( TCCR1B, 2, ON );
    // macsREG_BIT_SET( TCCR1B, 1, OFF );
    // macsREG_BIT_SET( TCCR1B, 0, OFF );

    // TCNT1 = 0x0000;                             /* Reset Timer 1 counter to 0. */
    // OCR1A = 31250;                              /* Setting the compare value to trigger interrupt. */
    
    // macsREG_BIT_SET( TIMSK1, 1, ON );        /* Enabling compare A interrupt in the Timer 1 mask register. */
    
    // macsENABLE_GLOBAL_INTERRUPTS();
}

// ISR( INT0_vect )
// {
//     // ucINT0_FLAG = 1;
// }

// ISR( TIMER1_COMPA_vect )
// {
//     // TCNT1 = 0x0000;
//     // macsREG_BIT_FLIP( PORTD, 4 );
// }