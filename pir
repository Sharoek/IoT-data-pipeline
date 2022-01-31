import RPi.GPIO as GPIO
import time
import httplib
import urllib
key = "API KEY"  # Put your API Key here

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(11, GPIO.IN)         #Read output from PIR motion sensor


def pirMotionSensor():
  while True:
    #DETECT MOTION
    HIGH_5V = GPIO.input(11)
    params = urllib.urlencode({'field1': HIGH_5V, 'key':key }) 
    headers = {"Content-typZZe": "application/x-www-form-urlencoded","Accept": "text/plain"}
    conn = httplib.HTTPConnection("api.thingspeak.com:80")
    
    if HIGH_5V==1:               #When output from motion sensor is HIGH
         try:
            conn.request("POST", "/update", params, headers)
            response = conn.getresponse()
            print HIGH_5V
            print response.status, response.reason
            data = response.read()
            conn.close()
        except:
            print "connection failed"
        break
        time.sleep(0.1)
        
if __name__ == "__main__":
        while True:
                pirMotionSensor()
