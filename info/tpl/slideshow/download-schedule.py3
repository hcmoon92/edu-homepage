from pydrive.drive import GoogleDrive
from pydrive.auth import GoogleAuth
import json
import os, sys, time
import csv
import imgkit


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
#print(file_list)
for file1 in file_list:
  print(file1['title'])
  if file1['mimeType'] != 'application/vnd.google-apps.folder':
    print('title: %s, id: %s' % (file1['title'], file1['id']))
    # Initialize GoogleDriveFile instance with file id.
    file = drive.CreateFile({'id': file1['id']})
    file.GetContentFile(newpath+'/'+file1['title']) # Download file and then save.    

dates = []
titles = []
contents = []
with open('./tta-academy/schedule/schedule.csv') as csvDataFile:
    csvReader = csv.reader(csvDataFile)
    for row in csvReader:
        dates.append(row[0])
        titles.append(row[1])
        contents.append(row[2])
 
#print(dates)
#print(titles)
#print(contents)

f = open("./tta-academy/schedule-tpl.html", "r")
print(f.read())
#f.write("Now the file has one more line!")

#imgkit.from_url('http://google.com', 'out.jpg')
#imgkit.from_file('test.html', 'out.jpg')
