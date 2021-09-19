#include "lcd.h"

void vLcdPrintNumber( int16_t iNum )
{
    if( iNum == 0 )
    {
        vLcdPrintChar( '0' );
        return;
    }
    else if( iNum < 0 )
    {
        vLcdPrintChar( '-' );           
        iNum *= -1;                     /* Convert from two's complement. */
    }
    
    char pcString[6] = { 0 };           /* 16-bit number can have at most 5 decimal digits plus a zero terminator. */
    int i;
    for( i = 4 ; iNum > 0; i--, iNum /= 10 )
    {
        pcString[i] = '0' + ( iNum % 10 );
    }

    vLcdPrint( pcString + i + 1 );      /* In case number is shorter than 5 digits. ( i = -1 after loop ). */
}