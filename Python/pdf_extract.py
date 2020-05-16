# -*- coding: utf-8 -*-
"""
Created on Sat May 16 12:17:30 2020

@author: Achuth MG
"""

import PyPDF2

pdffileobj = open('C://Users//kotre/Desktop/Chartered-Data-Scientists-Curriculum-2020 (1).pdf','rb')

pdfreader=PyPDF2.PdfFileReader(pdffileobj)

print(pdfreader.getNumPages())


pageobj=pdfreader.getPage(1)

text_in_page = pageobj.extractText()

print(text_in_page)

folder_name = text_in_page.lower().split(',')

folder_name1= [x.strip(' ') for x in folder_name]

folder_name2= [x.replace('\n','') for x in folder_name1]
replacethese=['(',')','\n','-']
folder_name3= [x.replace('(','') for x in folder_name2]
folder_name3= [x.replace(')','') for x in folder_name3]
folder_name3= [x.replace('-','') for x in folder_name3]
folder_name3= [x.replace(':','') for x in folder_name3]

import os
main_path='F:\GitHub Repo\FinestStatsModel\FinestStatsModel\Python'
os.chdir(main_path)
os.path.join(main_path,folder_name3[2])
paths=[]
for foldernames in folder_name3:
    paths.append(os.path.join(main_path,foldernames))
    
for path in paths:
    os.makedirs(path)

