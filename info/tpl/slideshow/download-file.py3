from pydrive.drive import GoogleDrive
from pydrive.auth import GoogleAuth
import json
import os, sys

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

dir_path = 'board'
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
