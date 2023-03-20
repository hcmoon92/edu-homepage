import RPi.GPIO as GPIO
from flask import Flask, render_template, request

from pydrive.drive import GoogleDrive
from pydrive.auth import GoogleAuth
import json
import os, sys

app = Flask(__name__)

GPIO.setmode(GPIO.BCM)

# Create a dictionary called pins to store the pin number, name, and pin state:
pins = {
   23 : {'name' : 'yellow', 'state' : GPIO.LOW},   
   24 : {'name' : 'green', 'state' : GPIO.LOW},
   25 : {'name' : 'red', 'state' : GPIO.LOW}
   }

# Set each pin as an output and make it low:
for pin in pins:
   GPIO.setup(pin, GPIO.OUT)
   GPIO.output(pin, GPIO.LOW)

@app.route("/")
def main():
   # For each pin, read the pin state and store it in the pins dictionary:
   for pin in pins:
      pins[pin]['state'] = GPIO.input(pin)
   # Put the pin dictionary into the template data dictionary:
   templateData = {
      'pins' : pins
      }
   # Pass the template data into the template main.html and return it to the user
   return render_template('weblamp.html', **templateData)

# The function below is executed when someone requests a URL with the pin number and action in it:
@app.route("/<changePin>/<action>")
def action(changePin, action):
   # Convert the pin from the URL into an integer:
   changePin = int(changePin)
   # Get the device name for the pin being changed:
   deviceName = pins[changePin]['name']
   # If the action part of the URL is "on," execute the code indented below:
   if action == "on":
      # Set the pin high:
      GPIO.output(changePin, GPIO.HIGH)
      # Save the status message to be passed into the template:
      message = "Turned " + deviceName + " on."
   if action == "off":
      GPIO.output(changePin, GPIO.LOW)
      message = "Turned " + deviceName + " off."
   if action == "toggle":
      # Read the pin and set it to whatever it isn't (that is, toggle it):
      GPIO.output(changePin, not GPIO.input(changePin))
      message = "Toggled " + deviceName + "."

   # For each pin, read the pin state and store it in the pins dictionary:
   for pin in pins:
      pins[pin]['state'] = GPIO.input(pin)

   # Along with the pin dictionary, put the message into the template data dictionary:
   templateData = {
      'message' : message,
      'pins' : pins
   }

   return render_template('weblamp.html', **templateData)
   

@app.route("/tta")
def download_file() :
  gauth = GoogleAuth()
  gauth.LocalWebserverAuth() # Creates local webserver and auto handles authentication.

  drive = GoogleDrive(gauth)

  # Auto-iterate through all files that matches this query
  file_list = drive.ListFile({'q': "'root' in parents and trashed=false"}).GetList()
  dir = {} #null dictionary
  for file1 in file_list:
    #print('title: %s, id: %s' % (file1['title'], file1['id']))

    if file1['mimeType'] == 'application/vnd.google-apps.folder':
      dir[file1['title']] = file1['id']
      # print(dir)

  #file_list = drive.ListFile({'q': "trashed=false", 'maxResults':5}).GetList()
  dir_path = 'info'
  newpath = './tta-academy/'+dir_path
  if not os.path.exists(newpath):
    os.makedirs(newpath)
    
  file_list = drive.ListFile({'q': "'"+dir[dir_path]+"' in parents and trashed=false"}).GetList()
  for file1 in file_list:
    if file1['mimeType'] != 'application/vnd.google-apps.folder':
      print('title: %s, id: %s' % (file1['title'], file1['id']))

      # Initialize GoogleDriveFile instance with file id.
      file = drive.CreateFile({'id': file1['id']})
      file.GetContentFile(newpath+'/'+file1['title']) # Download file and save.

  dir_path = 'notice'
  newpath = './tta-academy/'+dir_path
  if not os.path.exists(newpath):
    os.makedirs(newpath)

  file_list = drive.ListFile({'q': "'"+dir[dir_path]+"' in parents and trashed=false"}).GetList()
  for file1 in file_list:
    if file1['mimeType'] != 'application/vnd.google-apps.folder':
      print('title: %s, id: %s' % (file1['title'], file1['id']))

      # Initialize GoogleDriveFile instance with file id.
      file = drive.CreateFile({'id': file1['id']})
      file.GetContentFile(newpath+'/'+file1['title']) # Download file and then save.
    
  dir_path = 'schedule'
  newpath = './tta-academy/'+dir_path
  if not os.path.exists(newpath):
    os.makedirs(newpath)

  file_list = drive.ListFile({'q': "'"+dir[dir_path]+"' in parents and trashed=false"}).GetList()
  for file1 in file_list:
    if file1['mimeType'] != 'application/vnd.google-apps.folder':
      print('title: %s, id: %s' % (file1['title'], file1['id']))

      # Initialize GoogleDriveFile instance with file id.
      file = drive.CreateFile({'id': file1['id']})
      file.GetContentFile(newpath+'/'+file1['title']) # Download file and then save.    

   # Along with the pin dictionary, put the message into the template data dictionary:
  templateData = {
      'message' : 'ok'
     }

  return render_template('weblamp.html', **templateData)
   
@app.route("/tta/sched")
def schedule() :

  gauth = GoogleAuth()
  gauth.LocalWebserverAuth() # Creates local webserver and auto handles authentication.

  drive = GoogleDrive(gauth)

  # Auto-iterate through all files that matches this query
  file_list = drive.ListFile({'q': "'root' in parents and trashed=false"}).GetList()
  dir = {} #null dictionary
  for file1 in file_list:
    #print('title: %s, id: %s' % (file1['title'], file1['id']))

    if file1['mimeType'] == 'application/vnd.google-apps.folder':
      dir[file1['title']] = file1['id']
      # print(dir)

  dir_path = 'schedule'
  newpath = './tta-academy/'+dir_path
  if not os.path.exists(newpath):
    os.makedirs(newpath)

  file_list = drive.ListFile({'q': "'"+dir[dir_path]+"' in parents and trashed=false"}).GetList()
  for file1 in file_list:
    if file1['mimeType'] != 'application/vnd.google-apps.folder':
      print('title: %s, id: %s' % (file1['title'], file1['id']))

      # Initialize GoogleDriveFile instance with file id.
      file = drive.CreateFile({'id': file1['id']})
      file.GetContentFile(newpath+'/'+file1['title']) # Download file and then save.    

   # Along with the pin dictionary, put the message into the template data dictionary:
  templateData = {
      'message' : 'ok',
      'title' : '일정',
      'response' : '응답',
      'date' : 'date',
      'sched_title' : '1',
      'sched_content' : 'content'
     }

  return render_template('schedule.html', **templateData)
      
if __name__ == "__main__":
   app.run(host='0.0.0.0', port=8080, debug=True)
