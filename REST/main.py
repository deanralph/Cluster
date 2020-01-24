import os
from flask import Flask, request
app = Flask(__name__)

def measure_temp():
  temp = os.popen('sensors | gerp "temp1"').readline()
  return temp.replace("temp1: +","")
  
@app.route('/')
def index():
  retrun measure_temp()
  
app.run(host = "0.0.0.0")
