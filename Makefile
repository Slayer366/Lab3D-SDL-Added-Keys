CC := gcc

BIN  = ken
SRCS = adlibemu.c graphx.c init.c lab3d.c oldlab3d.c setup.c subs.c software.c
OBJS = $(SRCS:%.c=%.o)

WARNFLAGS = -Wall -Wno-pointer-sign -Wno-unused-result -Wno-unused-but-set-variable -Wno-unused-variable -Wno-unused-function
OPTFLAGS  = -O2 -fno-aggressive-loop-optimizations -fno-strict-aliasing


all: $(BIN)

clean:
	rm -f $(BIN) $(OBJS)

$(BIN): $(OBJS)
	$(CC) $(LDFLAGS) -fPIC -o $@ $(OBJS) $(shell sdl-config --libs) -lSDL_image -lm -lz

%.o: %.c
	$(CC) -DUSE_OSS -g $(WARNFLAGS) $(OPTFLAGS) $(CFLAGS) $(CPPFLAGS) $(shell sdl-config --cflags) -o $@ -c $<
