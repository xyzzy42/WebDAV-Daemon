-include build/*.d

all: build/webdavd build/rap

#-O3
#-g

build/webdavd: webdavd.c shared.c | build
	gcc -std=gnu99 -Werror -o $@ -O3 -pthread -I/usr/include/libxml2 $(filter %.c,$^) -MMD -lmicrohttpd -lxml2 -lgnutls

build/rap: rap.c shared.c | build
	gcc -std=gnu99 -Werror -o $@ -O3 -I/usr/include/libxml2 $(filter %.c,$^) -MMD -lpam -lxml2

build:
	mkdir $@
	
clean:
	rm -rf build

