# -*- coding: utf-8 -*-
"""
Created on Sun Dec 30 19:21:10 2018

@author: Bruno Carlos
"""

from scipy import misc
import numpy as np
s = misc.face()
s = misc.imread('answers.jpg')


matriz = s[:,:,0]
matriz = np.array(matriz).astype(int)


cont1 = 0
marcador = np.zeros(5)
r = np.zeros(90)
r = r.tolist()
    
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
    
       