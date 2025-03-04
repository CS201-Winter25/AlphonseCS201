# #!/bin/bash

# # 设置 LLVM 安装路径
# export LLVM_DIR=/opt/homebrew/opt/llvm/

# # 进入 build 目录并重新构建
# cd build
# cmake -DLT_LLVM_INSTALL_DIR=$LLVM_DIR ..
# make

# # 进入示例目录（如果需要）
# #cd ../our_example

# # 编译 demo.c 生成 LLVM bitcode (.bc 文件)
# clang -c -emit-llvm -fno-discard-value-names -O0 demo.c -o demo.bc

# # 运行 HelloWorld pass
# opt -load-pass-plugin ../build/lib/libHelloWorld.dylib -passes=hello-world -disable-output demo.bc

#!/bin/bash

export LLVM_DIR=/opt/homebrew/opt/llvm/

# 进入 build 并编译
cd build
cmake -DLT_LLVM_INSTALL_DIR=$LLVM_DIR ..
make
cd ..

# 遍历 our_example/ 和 test/ 目录下的所有 .c 文件
for file in phase3TestCases/*.c; do
    if [ -f "$file" ]; then
        echo "Processing $file..."
        bc_file="${file%.c}.bc"
        
        # 生成 LLVM Bitcode
        clang -S -fno-discard-value-names -emit-llvm "$file" -o "${file%.c}.ll"

        # 运行 LVN Pass
        opt -load-pass-plugin ./build/lib/libValueNumbering.dylib -passes=value-numbering -disable-output "${file%.c}.ll"
    fi
done