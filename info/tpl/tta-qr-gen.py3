import pyqrcode
import mysql.connector
import os, csv
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

def read_mysql_tta(mydb) :

	mycursor = mydb.cursor(dictionary=True)
	mycursor.execute("SELECT EVENT_ID, EVENT_NM  FROM `comtneventmanage` WHERE EVENT_BGNDE >= '20190101' AND EVENT_BGNDE <= '20191231'  ORDER BY EVENT_BGNDE DESC")
	myresult = mycursor.fetchall()
   
	ev_list = myresult
   #print(ev_list)

	output = []
	for ev_id in ev_list:
		mycursor = mydb.cursor(dictionary=True)
		mycursor.execute("SELECT APPLCNT_ID, MBER_NM, MOBLPHON, EMAIL FROM `comtneventuserinfo` WHERE EVENT_ID = '"+ev_id['EVENT_ID']+"'")
		myresult = mycursor.fetchall()

		if (len(myresult) > 0) :
			#output += ev_id['EVENT_ID']
			for row in myresult:
				output.append(ev_id['EVENT_ID'][-5:]+'-'+row['APPLCNT_ID'][-11:]+','+row['MBER_NM'])
		
	return(output)

def qr_gen(_aText) :
	
	for text in _aText :
		print(text[:17])
		ev_id = text[:5]
		app_id = text[6:17]
		
		newpath = './qr_codes/'+ev_id
		if not os.path.exists(newpath):
			os.makedirs(newpath)
    		
		code = pyqrcode.create(text+',https://edu.tta.or.kr/edc/TTAReqstView.do?eventId=EVENT_000000000'+ev_id, encoding='utf-8')
		code.png(newpath+'/'+'qr-code-'+app_id+'.png', scale=5)
	
aText = read_mysql_tta(mydb)     
qr_gen(aText)


def read_mysql_tpl(mydb) :
   
	'''
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
	'''



