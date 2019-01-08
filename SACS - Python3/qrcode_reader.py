# -*- coding: utf-8 -*-
"""
Created on Mon Jan  7 17:44:09 2019

@author: Bruno Carlos
"""
from pyzbar.pyzbar import decode, ZBarSymbol
from PIL import Image
decoded = decode(Image.open("qr-code(2).png"), symbols=[ZBarSymbol.QRCODE])