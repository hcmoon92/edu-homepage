import os
import requests
from bs4 import BeautifulSoup
from PIL import Image as PILImage
from PIL import ImageFont as PILImageFont
from PIL import ImageDraw as PILImageDraw

''' 
ep_url = 'http://comic.naver.com/webtoon/detail.nhn?titleId=20853&no=1093&weekday=tue'
html = requests.get(ep_url).text
soup = BeautifulSoup(html, 'html.parser')

 
#차례대로 이미지를 저장할 리스트 생성
image_list = []
 
#반복문이 돌때마다 값을 누적시킬 변수
full_width, full_height = 0, 0
 
 
for tag in soup.select('.wt_viewer img'):
    img_url = tag['src']
    img_name = os.path.basename(img_url)
    headers = {'Referer': ep_url}
    img_data = requests.get(img_url, headers=headers).content
    
    #파일 읽기/쓰기
    with open(img_name, 'wb') as f:
        #데이터를 써주기
        f.write(img_data)
        
        #지금 이미지를 im에 넣기
        im = PILImage.open(img_name)
        
        #가로, 세로 size를 지금 들러온 im에 맞춘다
        width, height = im.size
        
        #작업을 마친 이미지를 미리선언한 list에 차례대로 저장
        image_list.append(im)
        
        #최대 가로길이 설정. 가로의 x축0, y축은 im.size에서 수정한 가로너비
        full_width = max(full_width, width)
        
        #세로길이는 이미지가 누적될수록 계속 길어지므로 길이를 기존길이에서 더함
        full_height += height

'''

#font = PILImageFont.load_default().font

img = PILImage.new("RGBA", (800, 850), (255,255,255))
draw = PILImageDraw.Draw(img)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnBatangBold.ttf", 34)
draw.text((0,0), " TTA 아카데미 - UnBatangBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnBatang.ttf", 34)
draw.text((0,50), " TTA 아카데미 - UnBatang. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnDinaruBold.ttf", 34)
draw.text((0,100), " TTA 아카데미 - UnDinaruBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnDinaruLight.ttf", 34)
draw.text((0,150), " TTA 아카데미 - UnDinaruLight. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnDinaru.ttf", 34)
draw.text((0,200), " TTA 아카데미 - UnDinaru. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnDotumBold.ttf", 34)
draw.text((0,250), " TTA 아카데미 - UnDotumBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnDotum.ttf", 34)
draw.text((0,300), " TTA 아카데미 - UnDotum. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnGraphicBold.ttf", 34)
draw.text((0,350), " TTA 아카데미 - UnGraphicBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnGraphic.ttf", 34)
draw.text((0,400), " TTA 아카데미 - UnGraphic. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnGungseo.ttf", 34)
draw.text((0,450), " TTA 아카데미 - UnGungseo. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnPilgiBold.ttf", 34)
draw.text((0,500), " TTA 아카데미 - UnPilgiBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnPilgi.ttf", 34)
draw.text((0,550), " TTA 아카데미 - UnPilgi. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/baekmuk/batang.ttf", 34)
draw.text((0,600), " TTA 아카데미 - baekmuk/batang. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/baekmuk/dotum.ttf", 34)
draw.text((0,650), " TTA 아카데미 - baekmuk/dotum.ttf. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/baekmuk/gulim.ttf", 34)
draw.text((0,700), " TTA 아카데미 - baekmuk/gulim. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/baekmuk/hline.ttf", 34)
draw.text((0,750), " TTA 아카데미 - baekmuk/hline. ", (0,0,0), font=font)


'''
font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnGraphic.ttf", 34)
draw.text((0,450), " TTA 아카데미 - 연습입니다. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-core/UnGraphic.ttf", 34)
draw.text((0,450), " TTA 아카데미 - 연습입니다. ", (0,0,0), font=font)
'''

img.save("a_test.png")

img = PILImage.new("RGBA", (800, 850), (255,255,255))
draw = PILImageDraw.Draw(img)

#/usr/share/fonts/truetype/nanum
font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumBarunGothicBold.ttf", 34)
draw.text((0,0), " TTA 아카데미 - nanum/NanumBarunGothicBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumBarunGothicLight.ttf", 34)
draw.text((0,50), " TTA 아카데미 - nanum/NanumBarunGothicLight. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumBarunGothic.ttf", 34)
draw.text((0,100), " TTA 아카데미 - nanum/NanumBarunGothic. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumBarunGothicUltraLight.ttf", 34)
draw.text((0,150), " TTA 아카데미 - nanum/NanumBarunGothicUltraLight. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumBarunpenB.ttf", 34)
draw.text((0,200), " TTA 아카데미 - nanum/NanumBarunpenB. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumBarunpenR.ttf", 34)
draw.text((0,250), " TTA 아카데미 - nanum/NanumBarunpenR. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumBrush.ttf", 34)
draw.text((0,300), " TTA 아카데미 - nanum/NanumBrush. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumGothicBold.ttf", 34)
draw.text((0,350), " TTA 아카데미 - nanum/NanumGothicBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumGothic_Coding_Bold.ttf", 34)
draw.text((0,400), " TTA 아카데미 - nanum/NanumGothic_Coding_Bold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumGothic_Coding.ttf", 34)
draw.text((0,450), " TTA 아카데미 - nanum/NanumGothic_Coding. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumGothicExtraBold.ttf", 34)
draw.text((0,500), " TTA 아카데미 - nanum/NanumGothicExtraBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumGothicLight.ttf", 34)
draw.text((0,550), " TTA 아카데미 - nanum/NanumGothicLight. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumGothic.ttf", 34)
draw.text((0,600), " TTA 아카데미 - nanum/NanumGothic. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumMyeongjoBold.ttf", 34)
draw.text((0,650), " TTA 아카데미 - nanum/NanumMyeongjoBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumMyeongjoExtraBold.ttf", 34)
draw.text((0,700), " TTA 아카데미 - nanum/NanumMyeongjoExtraBold. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumMyeongjo.ttf", 34)
draw.text((0,750), " TTA 아카데미 - nanum/NanumMyeongjo. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/nanum/NanumPen.ttf", 34)
draw.text((0,800), " TTA 아카데미 - nanum/NanumPen. ", (0,0,0), font=font)

img.save("b_test.png")


img = PILImage.new("RGBA", (800, 850), (255,255,255))
draw = PILImageDraw.Draw(img)

#/usr/share/fonts/truetype/unfonts-extra
font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnJamoBatang.ttf", 34)
draw.text((0,0), " TTA 아카데미 - unfonts-extra/UnJamoBatang. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnJamoDotum.ttf", 34)
draw.text((0,50), " TTA 아카데미 - unfonts-extra/UnJamoDotum. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnJamoNovel.ttf", 34)
draw.text((0,100), " TTA 아카데미 - unfonts-extra/UnJamoNovel. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnJamoSora.ttf", 34)
draw.text((0,150), " TTA 아카데미 - unfonts-extra/UnJamoSora. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnPenheulim.ttf", 34)
draw.text((0,200), " TTA 아카데미 - unfonts-extra/UnPenheulim. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnPen.ttf", 34)
draw.text((0,250), " TTA 아카데미 - unfonts-extra/UnPen. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnPilgia.ttf", 34)
draw.text((0,300), " TTA 아카데미 - unfonts-extra/UnPilgia. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnShinmun.ttf", 34)
draw.text((0,350), " TTA 아카데미 - unfonts-extra/UnShinmun. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnTaza.ttf", 34)
draw.text((0,400), " TTA 아카데미 - unfonts-extra/UnTaza. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnVada.ttf", 34)
draw.text((0,450), " TTA 아카데미 - unfonts-extra/UnVada. ", (0,0,0), font=font)

font = PILImageFont.truetype("/usr/share/fonts/truetype/unfonts-extra/UnYetgul.ttf", 34)
draw.text((0,500), " TTA 아카데미 - unfonts-extra/UnYetgul. ", (0,0,0), font=font)

img.save("c_test.png")

os.system('feh -Z -R20 -q -F -r -Y -D5 .')


#--------------------- CANVAS image merge
#반복문이 돌때마다 값을 누적시킬 변수
full_width, full_height = 800, 1000
                
#캔버스 설정. 배경은 흰색
canvas = PILImage.new('RGB', (full_width, full_height), 'white')
 
output_height = 0

#캔버스에 현재 이미지를 붙여넣고(x축0, y축누적높이)
canvas.paste(img, (0, output_height))

''' 
#리스트에 있는 이미지를 캔버스에 덮어씌우기
for im in image_list:#이미지 하나하나, img_list는 im을 모아놓은 리스트
    #현재 이미지의 사이즈를 가로세로 변수에 넣는다
    width, height = im.size
    
    #캔버스에 현재 이미지를 붙여넣고(x축0, y축누적높이)
    canvas.paste(im, (0, output_height))
    
    #세로로 이미지를 붙이기 때문에 높이값을 누적시켜줘야 함
    output_height += height
'''

#반복문을 돌면 저장!
#canvas.save('merged.jpg')
