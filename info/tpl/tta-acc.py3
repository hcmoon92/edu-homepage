from jinja2 import Template
import os, sys, time
import imgkit
import mysql.connector
import csv
import datetime
 

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

def read_mysql_then_template(mydb) :

   '''
   mycursor = mydb.cursor(dictionary=True)
   keyword = sys.argv[1]
   mycursor.execute("SELECT EVENT_ID, EVENT_NM  FROM `comtneventmanage` WHERE EVENT_BGNDE >= '20190101' AND EVENT_BGNDE <= '20190301' ORDER BY EVENT_BGNDE DESC")
   myresult = mycursor.fetchall()
   #print(myresult)
   '''

   ev_id = 'EVENT_00000000001409'
   mycursor = mydb.cursor(dictionary=True)
   mycursor.execute("SELECT APPLCNT_ID, MBER_NM, MOBLPHON, EMAIL FROM `comtneventuserinfo` WHERE EVENT_ID = '"+ev_id+"'")
   myresult = mycursor.fetchall()
   print(myresult)
   
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
          an_item = dict(title=row['EVENT_NM'], content=row['EVENT_NM'], date=row['EVENT_BGNDE']+" ~ "+row['EVENT_ENDDE'], \
            id=row['EVENT_ID'], hours=row['TOTAL_TIME'], rate=row['PARTCPT_CT'], person=row['EVENT_CHARGER'], place=row['EVENT_PLACE'], status="waiting")
          items.append(an_item)
      
      # ... your code here ...
      #print(items)
      
      template = Template(f.read())
      __output = template.render(items=items)
      #output = template.render(title='John Doe')
      
      return __output
 
output = read_mysql_then_template(mydb)      
    
with open('output/out.html', 'w') as f:
    f.write(output)


#imgkit.from_url('http://google.com', 'out.jpg')
imgkit.from_file('output/out.html', 'output/out.jpg')
#imgkit.from_file('templates/tta-notice-jinja2.html', 'output/out1.jpg')

os.system('feh -Z -R20 -q -F -Y -D5 output')

#os.system('chromium-browser --kiosk output/out.html')


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
