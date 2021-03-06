# IoT, Detect motion via pir (passive infrared)

For this project I will be using python to create the script. It will involve the raspberry pi 3a+. 
The goal is that the raspberry pi should be able to use a pir motion detection to sense if someone is close by.

## The pipeline
![data_pipeline example01](https://user-images.githubusercontent.com/16138814/151881589-c38d8b45-90b7-4f92-a531-c4f844f36cce.png)

## Requirements
``` 
-> Raspberry Pi 4 or newer with raspbian OS
-> PIR motion sensor
-> Breadbord
-> Jump Wires
```

## How does PIR Work?
PIR stands for passive infrared. This sensor consists of a lens , an infrared detector and supporting detection circuitry.
The lens on the sensor detects any infrared radiation present infront of it. Our bodies generate infrared heat, and this gets detected by the pir.
Whenever the sensor detects a heat, the sensor outputs 5V signal for a period of one minute. The range of detection is 6 to 7 meters and is highly sensitive.


![OwM8JvL9jPJrGsBtt9BeFUm1jUCp1u7MxkIoU0SA](https://user-images.githubusercontent.com/16138814/151876298-da356439-8507-402f-a3b5-16a8f9769eee.jpg)


## Connection of the raspberry with the PIR

![EzxREB4bXOA0oJSqedw9TS24cUz9bPJPFpcdVldA](https://user-images.githubusercontent.com/16138814/151876555-70d63cd0-302f-4a1f-9e2e-1ebbf41bf2bc.jpg)

As you can see from the picture we read the output from GPIO 11. As soon as a motion is detected, the sensor will output a HIGH 5V signal to the raspberry. 
This gets catched by python and send over to Thingspeak.

For capturing data and to send it over to the middleware we will use Thingspeak. As it is very easy to implement 
