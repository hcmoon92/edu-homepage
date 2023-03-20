from jinja2 import Template
import os, sys, time
import imgkit
import mysql.connector
import csv
import datetime

import subprocess
import signal
import threading

import PIL
import RPi.GPIO as GPIO

  
mydb = mysql.connector.connect(
  host="localhost",
  user="phpmyadmin",
  passwd="12ttaa34!",
  database="edutta"
)

def read_mysql(mydb) :  
   mycursor = mydb.cursor()
   mycursor.execute("SELECT * FROM schedule")
   myresult = mycursor.fetchall()
   
   for x in myresult:
     print(x)
     
#read_mysql(mydb)     

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

#----- SCAN QR codes
def run_shell_command(cmd, cwd=None, timeout=5):
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=cwd)
    out = []
    err = []

    try:
        proc.wait(timeout=timeout)
    except subprocess.TimeoutExpired:
        run_shell_command(cmd, cwd, timeout)
        print('jj')
        #proc.poll()
        #proc.communicate()

    for line in proc.stdout.readlines():
        out.append(line.decode())

    for line in proc.stderr.readlines():
        err.append(line)
    return out, err, proc.pid 
    
def scan_qrcode_from_camera() :
   print('Please put your QR code on the camera!!! ')
   print('Scanning QR code... ')
   #os.system('sudo zbarcam --nodisplay')
   command = "zbarcam "

   __out = run_shell_command(command.split(), None, 5)
   print(__out)

def thread_run1() :
   print('Please put your QR code on the camera!!! ')
   print('Scanning QR code... ')
   #os.system('sudo zbarcam --nodisplay')
   cmd = 'zbarcam'
   out = []
   err = []
   
   proc = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
      
   # Wait until process terminates
   '''
   while proc.poll() == None:
       # We can do other things here while we wait
       time.sleep(.5)
       proc.poll()
       '''


   #threading.Timer(3, thread_run1).start()
   outs, errs = proc.communicate(timeout=20)
   print(outs, errs)
   
   try:
      outs, errs = proc.communicate(timeout=2)
   except subprocess.TimeoutExpired:
       proc.kill()
       #outs, errs = proc.communicate(timeout=20)
       threading.Timer(1, thread_run1).start()
   print(outs, errs)
   
def thread_run() :
   #print('Please put your QR code on the camera!!! ')
   print('Scanning QR code... ')
   #os.system('sudo zbarcam --nodisplay')
   cmd = 'python3 qr-reader.py3'
   
   try:
      output = subprocess.check_output(cmd, shell=True)
   except subprocess.CalledProcessError as exc:
      print("Status : FAIL", exc.returncode, exc.output)
   else:
      if output.decode("UTF-8") != "0\n" :
         print("Output: {}".format(output.decode("UTF-8")))
         GPIO.output(23, GPIO.HIGH)
         time.sleep(0.2)
         GPIO.output(23, GPIO.LOW)         
         time.sleep(0.2)
         GPIO.output(23, GPIO.HIGH)
         time.sleep(0.2)
         GPIO.output(23, GPIO.LOW)         
         time.sleep(0.2)
         GPIO.output(23, GPIO.HIGH)
         time.sleep(0.2)
         GPIO.output(23, GPIO.LOW)         
         time.sleep(0.2)
  
   threading.Timer(0.5, thread_run).start()

def read_mysql_then_template(mydb) :

   mycursor = mydb.cursor()
   mycursor.execute("SELECT * FROM schedule")
   #myresult = mycursor.fetchall()
   myresult = mycursor.fetchmany(10)

   with open('templates/tta-notice-jinja2.html') as f:
   
      items = []
      for row in myresult:
          # dict == {}
          # you just don't have to quote the keys
          an_item = dict(title=row[1], content=row[2], date="{:%y.%-m.%-d}".format(row[3])+" ~ "+"{:%y.%-m.%-d}".format(row[4]), id=row[0], hours=row[5], place=row[6], status="waiting")
          items.append(an_item)
      
      # ... your code here ...
      print(items)
      
      template = Template(f.read())
      __output = template.render(items=items)
      #output = template.render(title='John Doe')
      
      return __output


def run_proc(__ev_id, __user_id) :
   
   mydb = mysql.connector.connect(
     host="localhost",
     user="phpmyadmin",
     passwd="12ttaa34!",
     database="edutta"
   )
   
   ev_id = __ev_id
   user_id = __user_id
   mycursor = mydb.cursor(dictionary=True)
   mycursor.execute("SELECT APPLCNT_ID, MBER_NM, MOBLPHON, EMAIL FROM `comtneventuserinfo` WHERE EVENT_ID = '"+ev_id+"' AND APPLCNT_ID = '"+user_id+"'")
   #print(ev_id)
   #print(user_id)
   #mycursor.execute("SELECT APPLCNT_ID, MBER_NM, MOBLPHON, EMAIL FROM `comtneventuserinfo` WHERE EVENT_ID = 'EVENT_00000000001415' AND APPLCNT_ID = 'USRCNFRM_00000008555'")
   myresult = mycursor.fetchall()
   print(myresult)
   
   for row in myresult:
      user_name = row['MBER_NM']
   
   mycursor = mydb.cursor(dictionary=True)
   #keyword = sys.argv[1]
   mycursor.execute("SELECT EVENT_ID, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, EVENT_PLACE, EVENT_STM, \
     EVENT_ETM, EVENT_CHARGER, EVENT_CHARGER_TELNO, PARTCPT_CT, PSNCPA, RCEPT_BGNDE, RCEPT_ENDDE, TOTAL_TIME \
     FROM `comtneventmanage` WHERE EVENT_ID = '"+ev_id+"'")
   #mycursor.execute("SELECT EVENT_ID, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, EVENT_PLACE, EVENT_STM, \
   #  EVENT_ETM, EVENT_CHARGER, EVENT_CHARGER_TELNO, PARTCPT_CT, PSNCPA, RCEPT_BGNDE, RCEPT_ENDDE, TOTAL_TIME \
   #  FROM `comtneventmanage` WHERE EVENT_CHARGER LIKE '%"+keyword+"%' AND EVENT_BGNDE >= '20180101' AND EVENT_BGNDE <= '20190101' ORDER BY EVENT_BGNDE DESC")     
   myresult = mycursor.fetchall()
   #myresult = mycursor.fetchmany(10)
   print(myresult)
   
   with open('templates/tta-year-by-person-jinja2.html') as f:
   
      items = []
      for row in myresult:
          # dict == {}
          # you just don't have to quote the keys
          an_item = dict(name=user_name, title=row['EVENT_NM'], content=row['EVENT_NM'], date=row['EVENT_BGNDE']+" ~ "+row['EVENT_ENDDE'], \
            id=row['EVENT_ID'], hours=row['TOTAL_TIME'], rate=row['PARTCPT_CT'], person=row['EVENT_CHARGER'], place=row['EVENT_PLACE'], status="waiting")
          items.append(an_item)
      
      # ... your code here ...
      #print(items)
      
      template = Template(f.read())
      __output = template.render(items=items)
      #output = template.render(title='John Doe')
      
   with open('output/out.html', 'w') as f:
       f.write(__output)
      
   #imgkit.from_url('http://google.com', 'out.jpg')
   imgkit.from_file('output/out.html', 'output/out.jpg')
   #imgkit.from_file('templates/tta-notice-jinja2.html', 'output/out1.jpg')
   
   #subprocess.run('feh -Z -R20 -q -F -Y -D5 output', timeout=5)
   os.system('timeout 10s feh -Z -R20 -q -F -Y -D5 output')
   
   #os.system('chromium-browser --kiosk output/out.html')
      

def dummy_proc():
   print('processing...')
                
def thread_run3() :
   #print('Please put your QR code on the camera!!! ')
   print('Scanning QR code... ')
   cmd ='zbarcam'
   #cmd = 'python3 qr-reader.py3'
   
   proc = subprocess.Popen('zbarcam', stdout=subprocess.PIPE)
   while True:
      output = proc.stdout.readline()
      if output != '' and proc.poll() is None: # when process running
         decoded = output.decode('utf-8')
         if (decoded[:7] == 'QR-Code') : 
            ev_id = 'EVENT_000000000'+decoded[8:13]
            user_id = 'USRCNFRM_'+decoded[14:25]
            print(ev_id,user_id, decoded)
            
            run_proc(ev_id, user_id)
         else :
            print(decoded)
          
          #break
   #rc = proc.poll()
   
   ''' 
   while proc.poll() is None:
      time.sleep(1)
      proc.poll()
      results, errors = proc.communicate(timeout=1)
      #print(results)

      #out = proc.stdout.readlines()
      #out, err = proc.communicate()
      #print(out)
      print('Working...')
   '''
      
   #out, err = proc.communicate()
   #print(out)
   #print(out.decode('utf-8'))
      
   #print('Got barcode:%s', code)
       #run_proc()
 
       #isbn = code.split(':')[1]
       #p.close()
       #break;
       #os.system('chromium http://www.goodreads.com/search/search?q=%s'%isbn)

   #threading.Timer(3, thread_run3).start()

def thread_run2() :
   #print('Please put your QR code on the camera!!! ')
   #print('Scanning QR code... ')
   #os.system('sudo zbarcam --nodisplay')
   cmd = 'zbarcam'
   
   try:
      output = subprocess.check_output(cmd, shell=True)
   except subprocess.CalledProcessError as exc:
      print("Status : FAIL", exc.returncode, exc.output)
   else:
      if output.decode("UTF-8") != '0' :
         print("Output: {}".format(output.decode("UTF-8")))
  
   threading.Timer(0.5, thread_run).start()
    
   #status = json.loads(raw_status.decode("UTF-8"))
   #return (status["status"], status["message"]) 
           
#thread_run()
thread_run3()

   
   
#scan_qrcode_from_camera()



### ------------------------ functions
#------ import csv file
def import_csv() :
   with open('file.csv') as csvDataFile:
     
       csvReader = csv.reader(csvDataFile)
       next(csvReader, None)  # skip the headers
       
       for row in csvReader:
         #print(row)
         mycursor = mydb.cursor()
         sql = "INSERT INTO schedule (title, content, start_datetime, end_datetime, hours, place) \
         VALUES (%s, %s, %s, %s, %s, %s)"
         val = (row[1], row[2], row[3], row[4], row[5], row[6])
         mycursor.execute(sql, val)
         mydb.commit()
         #print(mycursor.rowcount, "record inserted.")
