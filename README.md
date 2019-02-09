# SACS

This is an automated system to score exams based on the images of the response sheets.

Basically It takes the images of the response sheets from those who took the test and automatically identifies the painted responses and compare to the right answers.

After that, It counts how many hits (we have four areas of knowledge in this exam) in each area the student got and calculates the score based on the standard deviation from the mean



1 - You need to use only the response mirror (example attached)
2- You need to provide the csv file with the right answers (example attached)


This is just a first attempt.This code was written in dec, 2017 and from there to here I've been studying and 
improving my skills as a programmer (I just have It as a hobby). The purpose of this profile is to track my evolution over the years.

I already a version of the GUI but in MATLAB, which is also available. 

I intend to write It all in python3 and add more features:

- A function to read a QRcode by which We will have the student informations, such as name, Id, Birthday etc. 
- A fucnction to take a pic (from user camera) of the target area, where We will can see the answers that were chosen by the student. Here We have to define the size.
- Once We have this picture, We can pass It to the code that reads the answers, which is already available here. 
- After that, the answers will be used in the mark_test.py function, also already done and available for testing, which is going to compute the hits of each student. 
- Finally we can grade the tests with a function that is still beeing written.
- All of that (scores and information about the students) will populate a database where I can consult all of that information(here We also have a very  initial version of the database model in SQL and in ER-model)

Feel free to contribute with our needs, mostly concerning the two first topics.


Att.


Bruno Carlos Vieira dos Santos

