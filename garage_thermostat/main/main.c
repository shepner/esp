#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "string.h"
#include "esp_system.h"
#include "nvs_flash.h"
// *** Include DS18B20 library
#include "ds18b20.h" 
// *** GPIO pin number for DS18B20
const int DS_PIN = 14; 
// *** Task measuring temperature
void mainTask(void *pvParameters) 
{
    DS_init(DS_PIN);
    while (1) 
    {
        printf("Temperature: %0.1f\n",DS_get_temp());
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}
void app_main()
{
    nvs_flash_init();
    xTaskCreatePinnedToCore(&mainTask, "mainTask", 2048, NULL, 5, NULL, 0);
}
