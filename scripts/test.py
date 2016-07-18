#!/usr/bin/python
# -*- coding: utf-8 -*-
# vim:ts=2:sw=2:expandtab

import os
import xcb
from xcb.xproto import *
from PIL import Image

XCB_MAP_STATE_VIEWABLE = 2

def screenshot():
  os.system('import -window root /tmp/.i3lock.png')

def xcb_fetch_windows():
  """ Returns an array of rects of currently visible windows. """

  x = xcb.connect()
  root = x.get_setup().roots[0].root

  rects = []

  # iterate through top-level windows
  for child in x.core.QueryTree(root).reply().children:
    # make sure we only consider windows that are actually visible
    attributes = x.core.GetWindowAttributes(child).reply()
    if attributes.map_state != XCB_MAP_STATE_VIEWABLE:
      continue

    rects += [x.core.GetGeometry(child).reply()]

  return rects

def obscure_image(image):
  """ Obscures the given image. """
  size = image.size
  pixel_size = 9

  image = image.resize((size[0] / pixel_size, size[1] / pixel_size), Image.NEAREST)
  image = image.resize((size[0], size[1]), Image.NEAREST)

  return image

def obscure(rects):
  """ Takes an array of rects to obscure from the screenshot. """
  image = Image.open('/tmp/.i3lock.png')

  for rect in rects:
    area = (
      rect.x, rect.y,
      rect.x + rect.width,
      rect.y + rect.height
    )

    cropped = image.crop(area)
    cropped = obscure_image(cropped)
    image.paste(cropped, area)

  image.save('/tmp/.i3lock.png')

def lock_screen():
#  os.system('i3lock -u -i /tmp/.i3lock.png')
  print "lock"

if __name__ == '__main__':
  # 1: Take a screenshot.
  screenshot()

  # 2: Get the visible windows.
  rects = xcb_fetch_windows()

  # 3: Process the screenshot.
  obscure(rects)

  # 4: Lock the screen
  lock_screen()
