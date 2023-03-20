import mysql.connector
import csv
import sys

mydb = mysql.connector.connect(
  host="localhost",
  user="phpmyadmin",
  passwd="12ttaa34!",
  database="edutta"
)

  
mycursor = mydb.cursor()
#mycursor.execute("SELECT * FROM `comtneventmanage` WHERE EVENT_ID = 'EVENT_00000000000521'")
#mycursor.execute("SELECT EVENT_ID, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, EVENT_PLACE, EVENT_STM, \
#  EVENT_ETM, EVENT_CHARGER, EVENT_CHARGER_TELNO, PARTCPT_CT, PSNCPA, RCEPT_BGNDE, RCEPT_ENDDE \
#  FROM `comtneventmanage` WHERE EVENT_BGNDE >= '20150101' ORDER BY EVENT_BGNDE DESC")

keyword = sys.argv[1]
mycursor.execute("SELECT EVENT_ID, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, EVENT_PLACE, EVENT_STM, \
  EVENT_ETM, EVENT_CHARGER, EVENT_CHARGER_TELNO, PARTCPT_CT, PSNCPA, RCEPT_BGNDE, RCEPT_ENDDE \
  FROM `comtneventmanage` WHERE EVENT_CHARGER LIKE '%"+keyword+"%' AND EVENT_BGNDE >= '20180101' AND EVENT_BGNDE <= '20190101' ORDER BY EVENT_BGNDE DESC")
  
myresult = mycursor.fetchall()

for x in myresult:
  print(x)


'''
#------ import csv file
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
'''
