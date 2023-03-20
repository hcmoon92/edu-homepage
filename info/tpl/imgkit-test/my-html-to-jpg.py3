import sys
import imgkit

# Get the total number of args passed to the demo.py
total = len(sys.argv)
# Get the arguments list 
#cmdargs = str(sys.argv)

#imgkit.from_url('http://google.com', 'out.jpg')
imgkit.from_file(sys.argv[1], 'out.jpg')
#imgkit.from_string('Hello!', 'out.jpg')

body = """
<html>
  <head>
    <meta name="imgkit-format" content="png"/>
    <meta name="imgkit-orientation" content="Landscape"/>
  </head>
  Hello World!
  </html>
"""

#imgkit.from_string(body, 'out.jpg')
