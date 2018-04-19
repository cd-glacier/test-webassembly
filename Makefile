
init:
	git clone https://github.com/juj/emsdk.git
	cd emsdk \
	./emsdk install --build=Release sdk-incoming-64bit binaryen-master-64bit \
	./emsdk activate --global --build=Release sdk-incoming-64bit binaryen-master-64bit \
	source ./emsdk_env.sh

compile:
	emcc ./src/hello.c -s WASM=1 -o ./output/hello.html

run:
	emrun --browser chrome ./output/hello.html
