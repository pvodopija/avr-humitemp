CC 			= avr-gcc
DEV 		= atmega328p
PROGRAMMER 	= arduino
PORT 		= /dev/ttyS3
BAUD 		= 115200
COMPILE		= $(CC) -Wall -Os -mmcu=$(DEV) # -save-temps ( use this for keeping assembly files ).
FILENAME 	= main
FILENAME2	= macs
FILENAME3 	= ./drivers/lcd
FILENAME4	= ./drivers/adc
FILENAME5	= ./drivers/dht11
FILENAME6	= ./drivers/power


default: compile upload clean

compile:
	
	$(COMPILE) -c $(FILENAME).c -o $(FILENAME).o
	$(COMPILE) -c $(FILENAME2).c -o $(FILENAME2).o
	$(COMPILE) -c $(FILENAME3).c -o $(FILENAME3).o
	# $(COMPILE) -c $(FILENAME4).h -o $(FILENAME4).o
	$(COMPILE) -c $(FILENAME5).c -o $(FILENAME5).o
	$(COMPILE) -o $(FILENAME).elf $(FILENAME).o $(FILENAME2).o $(FILENAME3).o $(FILENAME5).o
	avr-objcopy -j .text -j .data -O ihex $(FILENAME).elf $(FILENAME).hex
	avr-size --format=avr --mcu=$(DEV) $(FILENAME).elf

upload:
	avrdude -v -p $(DEV) -c $(PROGRAMMER) -P $(PORT) -b $(BAUD) -U flash:w:$(FILENAME).hex:i
	# avrdude -v -p $(DEV) -c $(PROGRAMMER) -P $(PORT) -U flash:w:$(FILENAME).hex:i

clean:
	rm $(FILENAME).o $(FILENAME).elf $(FILENAME).hex

asmdump:
	$(COMPILE) -S $(FILENAME).c -o $(FILENAME).s
	$(COMPILE) -S $(FILENAME3).c -o $(FILENAME3).s
	$(COMPILE) -S $(FILENAME4).c -o $(FILENAME4).s

