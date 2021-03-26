#include <avr/io.h>

#ifndef F_CPU
#define F_CPU 16000000UL
#endif

#include <util/delay.h>
#include "dht11.h"
#include "../testing.h"
#include "lcd.h"

/*
Okay so, DHT11 data pin is always pulled HIGH by a 5.1kOhm resistor connected to VCC
 We communicate via serial one-bit connection and are expecting 40 bits of data, with the last 8 bits being check-sum.
Here is the communication procol:
( 1 ) MCU signals LOW for at least 18ms to initiate the connection and wake the module from the low power mode. After that MCU pulls HIGH again for 20-40us.
( 2 ) DHT11 sends response signal pulling LOW for 80us and then pulling HIGH for another 80us.
( 3 ) DHT11 sends the actual 40 bits of data with 50us of LOW before each bit. Both logical zero and one are represented by the module pulling HIGH, it's the durration that matters.
        0 -> HIGH for 26-28us.
        1 -> HIGH for 70us.
*/

int8_t iDhtRead( volatile uint8_t* puiPinReg, uint8_t uiPin )
{
    volatile uint8_t* puiDDR = puiPinReg + 1;       /* Direction register for a respective pin register is always one address above. */
    volatile uint8_t* puiPort = puiPinReg + 2;      /* Port register for a respective pin register is always two address above. */
    testingREG_BIT_SET( *puiDDR, uiPin, ON );
    
    /* Step ( 1 ) */
    testingREG_BIT_SET( *puiPort, uiPin, OFF );
    _delay_ms( 20 );
    testingREG_BIT_SET( *puiPort, uiPin, ON );
    _delay_us( 30 );

    /* Step ( 2 ) */
    testingREG_BIT_SET( *puiDDR, uiPin, OFF );
    // testingREG_BIT_SET( *puiPort, uiPin, ON );      /* Activating pull-up resistor. */

    // while( testingIO_BIT_GET( *puiPinReg, uiPin ) );

    uint8_t i;
    
    for( i = 0; !testingIO_BIT_GET( *puiPinReg, uiPin ); i++ )
    {
        if( i > 90 )
        {
            return -ECONCT;
        }
        _delay_us( 1 );
    }

    for( i = 0; testingIO_BIT_GET( *puiPinReg, uiPin ); i++ )
    {
        if( i > 90 )
        {
            return -ECONCT;
        }
        _delay_us( 1 );
    }
    
    /* Step 3 */
    for( i = 0; i < 5; i++ )
    {
        uint8_t uiByte = 0x00;
        for( int j = 7; j >= 0; j-- )
        {   
            uint8_t us_ = 0;
            for( us_ = 0; !testingIO_BIT_GET( *puiPinReg, uiPin ); us_++ )
            {
                if( us_ > 55 )
                {
                    return -ETRANS;
                }
                _delay_us( 1 );
            }
            
            for( us_ = 0; testingIO_BIT_GET( *puiPinReg, uiPin ); us_++ )
            {
                if( us_ > 80 )
                {
                    return -ETRANS;
                }
                _delay_us( 1 );
            }
            
            if( us_ < 30 )
            {
                uiByte &= ~( 1 << j );
            }
            else
            {
                
                uiByte |= ( 1 << j );
            }
        }
        *( ( ( uint8_t* ) &xDhtData ) + i ) = uiByte;
    }

    if( xDhtData.uiHumidityDecimal + xDhtData.uiHumidityIntegral + xDhtData.uiTemperatureDecimal + xDhtData.uiTemperatureIntegral != xDhtData.uiCheckSum )
    {
        return -ECHKSUM;
    }
    
    return OK;
}