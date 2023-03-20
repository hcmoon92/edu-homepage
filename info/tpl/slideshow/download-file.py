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

#file_list = drive.ListFile({'q': "trashed=false", 'maxResults':5}).GetList()
dir_path = 'info'
file_list = drive.ListFile({'q': "'"+dir[dir_path]+"' in parents and trashed=false"}).GetList()
for file1 in file_list:
  if file1['mimeType'] != 'application/vnd.google-apps.folder':
    print('title: %s, id: %s' % (file1['title'], file1['id']))

    # Initialize GoogleDriveFile instance with file id.
    file = drive.CreateFile({'id': file1['id']})
    path = './tta-academy/'+dir_path
    os.mkdir( path, 0755 )
    file.GetContentFile(path+'/'+file1['title']) # Download file and save.

dir_path = 'notice'
file_list = drive.ListFile({'q': "'"+dir[dir_path]+"' in parents and trashed=false"}).GetList()
for file1 in file_list:
  if file1['mimeType'] != 'application/vnd.google-apps.folder':
    print('title: %s, id: %s' % (file1['title'], file1['id']))

    # Initialize GoogleDriveFile instance with file id.
    file = drive.CreateFile({'id': file1['id']})
    path = './tta-academy/'+dir_path
    os.mkdir( path, 0755 );
    file.GetContentFile(path+'/'+file1['title']) # Download file and then save.
