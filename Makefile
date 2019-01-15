deploy: build push

clean:
	rm -fR build/

build: clean
	vangen -out=build

push:
	firebase login --no-localhost
	firebase deploy
