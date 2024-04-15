REM Compile the bootloader file
nasm -f bin -o .\build\boot.bin .\boot\bootloader.S

REM Compile the binary file into disk images
dd if=./build/boot.bin of=./build/boot.flp

REM imdisk -a -f .\build\x86\boot.flp -s 1440k -m B:

REM Remove bin file
rm ./build/boot.bin