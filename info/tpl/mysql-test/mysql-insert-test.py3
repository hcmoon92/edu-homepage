import mysql.connector
import csv

mydb = mysql.connector.connect(
  host="localhost",
  user="phpmyadmin",
  passwd="12ttaa34!",
  database="ttaedu"
)

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
  
mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM schedule")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)


