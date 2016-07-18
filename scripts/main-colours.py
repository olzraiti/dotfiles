#!/usr/bin/python

import Image, ImageDraw
from random import shuffle

def rgb2hex(rgb):
    r = rgb[1][0]
    g = rgb[1][1]
    b = rgb[1][2]
    return '#{:02x}{:02x}{:02x}'.format(r,g,b) 

def get_colors(infile, outfile, numcolors=10, swatchsize=20, resize=150):
 
    image = Image.open(infile)
    image = image.resize((resize, resize))
    result = image.convert('P', palette=Image.ADAPTIVE, colors=numcolors)
    result.putalpha(0)
    colors = result.getcolors(resize*resize)
 
    shuffle(colors)
    for color in colors:
        print rgb2hex(color)

    # Save colors to file
 
    pal = Image.new('RGB', (swatchsize*numcolors, swatchsize))
    draw = ImageDraw.Draw(pal)
 
    posx = 0
    for count, col in colors:
        draw.rectangle([posx, 0, posx+swatchsize, swatchsize], fill=col)
        posx = posx + swatchsize
 
    del draw
    pal.save(outfile, "PNG")
 
if __name__ == '__main__':
    get_colors('wallpaper', 'outfile.png')
