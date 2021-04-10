# avr-humitemp
It felt a little bit unsatisfying using libraries for this project, so I decided to write everything from scratch using these datasheets: <br/>
<ul>
  <li>( MCU ) https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf </li>
  <li>( LCD ) http://fab.cba.mit.edu/classes/863.06/11.13/44780.pdf </li>
  <li>( DHT11 ) https://www.mouser.com/datasheet/2/758/DHT11-Technical-Data-Sheet-Translated-Version-1143054.pdf </li>
</ul>

<h3>How it works?</h3>
After booting up the MCU initializes the LCD display in the 8-bit mode using PORTD ( 2 ... 7 ) and PORTB ( 0, 1 ) as an 8-bit data bus, and PORTB ( 2, 3, 4 )
for display commands.<br/>
Afterwards, initializing the on-chip Analog to Digital converter in a single conversion mode(section 23 in the datasheet). <br/>
Finally, reading DHT11 sensor data every 10 seconds using 1-bit serial connection and displaying it on the LCD. <br/>
