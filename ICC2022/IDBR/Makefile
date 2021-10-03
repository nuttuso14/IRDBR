CC = g++ 
CFLAGS = -g -c 
LIBS = -lm 
INCLUDE = -I/usr/include 
 
all: main  
 
main:	UE.o random.o e_list.o event.o random.o main.o 
	$(CC) -o $@ $? $(LIBS) 	 
 
#main.o:	equalSharing.cpp event.h e_list.h mydef.h 
#	$(CC) $(CFLAGS) -o $@ equalSharing.cpp $(INCLUDE)  
 
# main.o:	APfirst.cpp event.h e_list.h mydef.h 
# 	$(CC) $(CFLAGS) -o $@ APfirst.cpp $(INCLUDE)  
 
main.o:	newMethod_krtt.cpp event.h e_list.h mydef.h 
	$(CC) $(CFLAGS) -o $@ newMethod_krtt.cpp $(INCLUDE) 
 
random.o:	random.cc random.h 
	$(CC) $(CFLAGS) -o $@ random.cc $(INCLUDE) 
                                     
e_list.o:	e_list.cc e_list.h event.h 
	$(CC) $(CFLAGS) -o $@ e_list.cc $(INCLUDE) 
 
event.o:	event.cc event.h mydef.h 
	$(CC) $(CFLAGS) -o $@ event.cc $(INCLUDE) 
 
UE.o:  UE.cc UE.h 
	$(CC) $(CFLAGS) -o $@ UE.cc $(INCLUDE) 
 
clean: 
	rm *.o  
 
