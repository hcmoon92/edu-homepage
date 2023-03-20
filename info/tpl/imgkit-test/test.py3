import imgkit

#imgkit.from_url('http://google.com', 'out.jpg')
imgkit.from_file('test.html', 'out.jpg')
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
