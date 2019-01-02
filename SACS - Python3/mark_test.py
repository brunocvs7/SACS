# -*- coding: utf-8 -*-
"""
Created on Tue Jan  1 22:10:01 2019

@author: Bruno Carlos
"""
def mark_test(answers, lang):
    import numpy as np
    import pandas as pd
    lang = lang
    r = answers
    
    import pandas as pd
    rans = pd.read_csv('gabarito.csv', header = None)
    
    if lang == 'I':
        gab = rans[0:3], rans[5:]
    else:
        gab = rans[3:]
        
    correcao = gab.reset_index(drop=True) == r.reset_index(drop=True)
    
    ch = np.array(correcao[23:46]).tolist().count([True])
    cn = np.array(correcao[68:90]).tolist().count([True])
    li = np.array(correcao[0:23]).tolist().count([True])
    mt = np.array(correcao[46:68]).tolist().count([True])
    
    
    return(pd.DataFrame({"Acertos":[li,ch,cn,mt], "Disciplina":["Linguagens","Ciências Humanas", "Ciências da Natureza", "Matemática"]}))
