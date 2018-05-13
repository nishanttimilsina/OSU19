OBJS = gamePlay.cpp Menu.cpp Doodlebug.cpp Ant.cpp Critter.cpp
CC = g++ -std=c++11
DEBUG = -g
CFLAGS = -Wall
EXECUTABLE = game

all: $(OBJS) $(EXECUTABLE)

$(EXECUTABLE) : $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

clean:
	rm -f *.o game