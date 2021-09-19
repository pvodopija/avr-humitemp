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
#include "drivers/power.h"

volatile uint8_t ucPCINT1_FLAG = 0;

int main( void )
{    
    for( ;; )
    {
        setup();

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

        lcdCLEAR_DISPLAY();
        vLcdPrint( "Good\nBye!" );
        _delay_ms( 2000 );

        /* Turning off peripherals and sleeping. */        
        macsIO_BIT_SET( PORTC, 0, OFF );    /* Cutting power to the peripherals. */
        DDRD = DDRC = DDRB = 0x00;          /* All pins to input. */
        powerSLEEP( POWER_DOWN_MODE );
        macsIO_BIT_SET( DDRC, 0, ON );
        macsIO_BIT_SET( PORTC, 0, ON );     /* Turning back power upon waking up. */
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
    
    macsIO_BIT_SET( DDRC, 0, 1 );       /* Using A0 pin as power supply for the board. Turn this off when going into power saving mode. */
    macsIO_BIT_SET( PORTC, 0, 1 );      
    _delay_ms( 10 );

    /* Initializing LCD and ADC. */
    vLcdInit( lcdDEFAULT_MODE );
    vLcdPrint( "Initializing..." );
    vAdcInit();
    _delay_ms( 1500 );

    /* Setting up A5 pin for push button triggered interrupt ( waking from sleep mode ). */
    macsREG_BIT_SET( PORTC, 5, ON );
    macsREG_BIT_SET( PCICR, 1, ON  );
    macsREG_BIT_SET( PCMSK1, 5, ON );

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
    
    macsENABLE_GLOBAL_INTERRUPTS();
}

/* Push button interrupt ( waking from sleep ). */
ISR( PCINT1_vect )
{
    ucPCINT1_FLAG = 1;
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