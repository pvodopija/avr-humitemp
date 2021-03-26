#ifndef DHT11_H
#define DHT11_H

struct xDHT_DATA {
    uint8_t uiHumidityIntegral;
    uint8_t uiHumidityDecimal;
    uint8_t uiTemperatureIntegral;
    uint8_t uiTemperatureDecimal;
    uint8_t uiCheckSum;
} xDhtData;

int8_t iDhtRead( volatile uint8_t* puiPort, uint8_t uiPin );    /* Returns 0 if check-sum is correct. */

/* Error codes. */
#define OK      0
#define ECONCT  2
#define ETRANS  3
#define ECHKSUM 4

#endif