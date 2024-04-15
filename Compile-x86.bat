REM Compile the bootloader file
nasm -f bin -o .\build\x86\boot.bin .\boot\x86\bootloader.S

REM Compile the binary file into disk images
dd if=./build/x86/boot.bin of=./build/x86/boot.flp

REM imdisk -a -f .\build\x86\boot.flp -s 1440k -m B:

REM Remove bin file
rm ./build/x86/boot.bin