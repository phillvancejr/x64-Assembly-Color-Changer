default: colors

includes=-I/usr/local/include
libs=/usr/local/lib/libraylib.a -framework Cocoa -framework OpenGL -framework IOKit

colors: colors.s main.o
	clang -o colors $(libs) main.o colors.s

main.o: main.c
	clang -c $(includes) main.c
