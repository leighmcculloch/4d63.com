deploy: build push

clean:
	rm -fR build/

build: clean .bin/vangen
	.bin/vangen -out build

push: .bin/node_modules/.bin/firebase
	[ ! -t 0 ] || .bin/node_modules/.bin/firebase login --no-localhost
	.bin/node_modules/.bin/firebase deploy

.bin:
	mkdir .bin

.bin/vangen:
	GOBIN=$$PWD/.bin go get -u 4d63.com/vangen

.bin/node_modules/.bin/firebase: .bin
	yarn --no-lockfile --modules-folder=.bin/node_modules add firebase-tools
