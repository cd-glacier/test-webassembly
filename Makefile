
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

custom-func-compile:
	emcc -o $(output_dir)/hello3.html $(src_dir)/custom-func/hello3.c -O3 -s WASM=1 --shell-file $(src_dir)/custom-func/shell_minimal.html -s NO_EXIT_RUNTIME=1 --emrun

custom-func:
	emrun --browser chrome $(output_dir)/hello3.html

text-format:
	wat2wasm $(src_dir)/wasm-text/simple.wat -o $(src_dir)/wasm-text/simple.wasm 

show-binary:
	wat2wasm -v $(src_dir)/wasm-text/simple.wat

add-compile:
	wasm-as $(src_dir)/add/add.wast > $(src_dir)/add/add.wasm

add:
	emrun --browser chrome $(src_dir)/add/index.html


