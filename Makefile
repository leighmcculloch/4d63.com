deploy: build push

clean:
	rm -fR build/

build: clean
	go run 4d63.com/vangen@latest -out=build
