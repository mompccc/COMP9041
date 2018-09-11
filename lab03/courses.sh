#!/bin/sh
course=`echo $1 | cut -c1`
wget -q -O- "http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=$course" | grep $1 | cut -d'>' -f2 | cut -d'<' -f1 | grep $1
wget -q -O- "http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=$course" | grep $1 | cut -d'>' -f2 | cut -d'<' -f1 | grep $1
