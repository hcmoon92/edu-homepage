from pydrive.drive import GoogleDrive
from pydrive.auth import GoogleAuth
import imgkit

#------------------ GOOGLE SEARCH DIR
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
    
#---------------- GOOGLE UPLOAD NOTICE
from datetime import datetime
stime = datetime.now().strftime('%Y%m%d%H%M%S')
title = stime+'.jpg'

f = drive.CreateFile({'title': title, "parents": [{"kind": "drive#fileLink", "id": dir['notice']}]})
f.SetContentFile('./imgkit-test/out.jpg') # Set content of the file.
f.Upload()

f = drive.CreateFile({'title': 'Hello.txt', "parents": [{"kind": "drive#fileLink", "id": dir['notice']}] })  # Create GoogleDriveFile instance with title 'Hello.txt'.
f.SetContentString('Hello World - 한글!') # Set content of the file from given string.
f.Upload()

#imgkit.from_url('https://edu.tta.or.kr', 'out.jpg')
