# -*- coding: utf-8 -*-
"""
Created on Sun Dec 30 19:21:10 2018

@author: Bruno Carlos
"""

# Here I used the scipy library and misc method to read a image. 


from mark_test import mark_test
from scipy import misc
import numpy as np
import pandas as pd

lang = 'E'

# Reading the image
s = misc.face()
s = misc.imread("answers'.jpg")

#Catching only one dimension and transforming It to int format
matriz = s[:,:,0]
matriz = np.array(matriz).astype(int)

#Initializing some variables

cont1 = 0
marcador = np.zeros(5)
r = np.zeros(90)
r = r.tolist()
# Here is the heart of this code.
# The image has a size of 435 x 1065
# This first for loop points to the columns of the image, so the first column we analyse is the 47th
#After that, we look to the rows, which starts in the 15th row
# Our study starts in the point (15,47). If you look to the image, you will see that It points to the first circle of the first question

for i in np.arange(47,938,178):
        
    for x in np.arange(15,436,30):
        
        w = 0
        j = i
        y = j + 20
        cont = 0
        while w < 5:
            
            while j <=y :
                
                cont = cont + matriz[x,j]
                j = j+1
                
            marcador[w] = cont
            cont = 0
            j = j + 3
            y = j + 22
            w = w+1
            
    
    
        m = np.array(marcador)
        p = m.argmin()
    
   
        for v in np.arange(0,5):
                
            if m[v] < 2100:
                m[v] = 1
            else:
                m[v] = 0
           
        soma = m.sum() 
    
        if soma > 1:
            r[cont1] = '-'
        elif soma == 0:
            r[cont1] = '-'
        elif p == 0:
            r[cont1] = 'A'
        elif p ==  1:
            r[cont1] = 'B'
        elif p == 2:
            r[cont1] = 'C'
        elif p == 3:
            r[cont1] = 'D'
        else:
            r[cont1] = 'E'           
            
        cont1 = cont1 +1 
    

r = pd.DataFrame(r)

resultado = mark_test(r, lang)