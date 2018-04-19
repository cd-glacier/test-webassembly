
src_dir=./src
output_dir=./output

init:
	git clone https://github.com/juj/emsdk.git
	cd emsdk \
	./emsdk install --build=Release sdk-incoming-64bit binaryen-master-64bit \
	./emsdk activate --global --build=Release sdk-incoming-64bit binaryen-master-64bit \
	source ./emsdk_env.sh

hello-world-compile:
	emcc $(src_dir)/hello.c -s WASM=1 -o $(output_dir)/hello.html

hello-world:
	emrun --browser chrome $(output_dir)/hello.html

html-template-compile:
	emcc -o $(output_dir)/hello2.html $(src_dir)/html_template/hello2.c -O3 -s WASM=1 --shell-file $(src_dir)/html_template/shell_minimal.html

html-template:
	emrun --browser chrome $(output_dir)/hello2.html

