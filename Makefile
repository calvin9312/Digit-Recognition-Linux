CC= g++
#CFLAGS= -I "./lib/Eigen3" -O3 -DNDEBUG -g -Wall # -pg -no-pie
CFLAGS= -I "/usr/include/eigen3/" -O3 -DNDEBUG -g -Wall # -pg -no-pie

all: network-1 network-2 conv-network

network-1: train-network1.run run-tests1.run;

network-2: train-network2.run run-tests2.run;

conv-network: conv-train-network.run conv-run-tests.run;

########################################################################################################################
# Single Hidden Layer Network
########################################################################################################################

train-network1.run: train-network1.o network1.o functions.o
	$(CC) $(CFLAGS) train-network1.o network1.o functions.o -o train-network1.run

train-network1.o: train-network1.cpp network1.h functions.h
	$(CC) $(CFLAGS) "./src/single_hidden_layer/train-network1.cpp" -c

train-network1.cpp:

network1.h:

network1.o: network1.cpp network1.h functions.h
	$(CC) $(CFLAGS) "./src/single_hidden_layer/network1.cpp" -c

network1.cpp:

run-tests1.run: run-tests1.o network1.o functions.o
	$(CC) $(CFLAGS) run-tests1.o network1.o functions.o -o run-tests1.run

run-tests1.o: run-tests1.cpp functions.h network1.h
	$(CC) $(CFLAGS) "./src/single_hidden_layer/run-tests1.cpp" -c

run-tests1.cpp:

########################################################################################################################
# Double Hidden Layer Network
########################################################################################################################

train-network2.run: train-network2.o network2.o functions.o
	$(CC) $(CFLAGS) train-network2.o network2.o functions.o -o train-network2.run

train-network2.o: train-network2.cpp network2.h functions.h
	$(CC) $(CFLAGS) "./src/double_hidden_layer/train-network2.cpp" -c

train-network2.cpp:

network2.h:

network2.o: network2.cpp network2.h functions.h
	$(CC) $(CFLAGS) "./src/double_hidden_layer/network2.cpp" -c

network2.cpp:

run-tests2.run: run-tests2.o network2.o functions.o
	$(CC) $(CFLAGS) run-tests2.o network2.o functions.o -o run-tests2.run

run-tests2.o: run-tests2.cpp functions.h network2.h
	$(CC) $(CFLAGS) "./src/double_hidden_layer/run-tests2.cpp" -c

run-tests2.cpp:

########################################################################################################################
# Convolutional Network
########################################################################################################################

conv-train-network.run: conv-train-network.o conv-network.o functions.o
	$(CC) $(CFLAGS) conv-train-network.o conv-network.o functions.o -o conv-train-network.run

conv-train-network.o: conv-train-network.cpp conv-network.h functions.h
	$(CC) $(CFLAGS) "./src/convolutional_network/conv-train-network.cpp" -c

conv-train-network.cpp:

conv-network.h:

conv-network.o: conv-network.cpp conv-network.h functions.h
	$(CC) $(CFLAGS) "./src/convolutional_network/conv-network.cpp" -c

conv-network.cpp:

conv-run-tests.run: conv-run-tests.o conv-network.o functions.o
	$(CC) $(CFLAGS) conv-run-tests.o conv-network.o functions.o -o conv-run-tests.run $(CFLAGS)

conv-run-tests.o: conv-run-tests.cpp functions.h conv-network.h
	$(CC) $(CFLAGS) "./src/convolutional_network/conv-run-tests.cpp" -c

conv-run-tests.cpp:

########################################################################################################################
# Shared functions
########################################################################################################################
functions.o: functions.cpp functions.h
	$(CC) $(CFLAGS) "./src/functions.cpp" -c

functions.h:

functions.cpp:

clean:
	rm *.o *.run

