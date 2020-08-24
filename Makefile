CFLAGS=-std=c11 -g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

9cc: $(OBJS)
		$(CC) -o 9cc $(OBJS) $(LDFLAGS)

$(OBJS): 9cc.h

test: 9cc
		./test.sh

clean:
		rm -f 9cc *.o *~ tmp*

docker-build:
		docker build -t pco2699/9cc .

docker-run:
		docker run --rm -it -v $(CURDIR):/app pco2699/9cc ash


.PHONY: test clean docker-build docker-run