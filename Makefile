CC=g++
CPP=gcc
TARGET=sms
DEBUG=-g
LFLAGS=-Wall $(DEBUG)
CFLAGS=$(LFLAGS) -c
PUDIR=/Developer/Extras/CoreAudio/PublicUtility
FRAMEWORKS=-framework IOKit -framework CoreFoundation -framework CoreServices -framework AudioUnit -framework AudioToolbox -I $(PUDIR)
DEPS=unimotion.o CAXException.o CAStreamBasicDescription.o CAAudioUnit.o CAComponentDescription.o CAComponent.o CAAudioChannelLayout.o CAAudioChannelLayoutObject.o

all: $(TARGET)

$(TARGET) : main.cpp $(DEPS)
	$(CPP) $(LFLAGS) main.cpp -o $(TARGET) $(FRAMEWORKS) $(DEPS)

unimotion.o : unimotion.c unimotion.h
	$(CC) $(CFLAGS) $<

CAXException.o : $(PUDIR)/CAXException.cpp $(PUDIR)/CAXException.h
	$(CPP) $(CFLAGS) $<

CAComponent.o : $(PUDIR)/CAComponent.cpp $(PUDIR)/CAComponent.h
	$(CPP) $(CFLAGS) $<

CAStreamBasicDescription.o : $(PUDIR)/CAStreamBasicDescription.cpp $(PUDIR)/CAStreamBasicDescription.h
	$(CPP) $(CFLAGS) $<

CAComponentDescription.o : $(PUDIR)/CAComponentDescription.cpp $(PUDIR)/CAComponentDescription.h
	$(CPP) $(CFLAGS) $<

CAAudioUnit.o : $(PUDIR)/CAAudioUnit.cpp $(PUDIR)/CAAudioUnit.h
	$(CPP) $(CFLAGS) $<

CAAudioChannelLayout.o : $(PUDIR)/CAAudioChannelLayout.cpp $(PUDIR)/CAAudioChannelLayout.h
	$(CPP) $(CFLAGS) $<

CAAudioChannelLayoutObject.o : $(PUDIR)/CAAudioChannelLayoutObject.cpp
	$(CPP) $(CFLAGS) $<

.IGNORE .PHONY clean :
	rm $(TARGET)
	rm *.o
	rm *.gch
	rm -rf $(TARGET).dSYM
