# CMSC 313 - HW#11: Print out data in ascii hex
**Kevin Ishimwe**  
**Mon-Wed 8:30am Section prof kidd**

## 🔧 Description
ASSIGNMENT: Produce a program that will take a number of bytes of data and print that data to the screen.
 
DETAILS: Given the following data
 
inputBuf:
```
    db  0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A 
```

place the translated data into the output buffer
outputBuf:
```
    resb 80 
```
 
And print the contents of outputBuf to the screen. Remember to advance to the next line at the end of the output buffer.
 
### Example Output:

 ```
 tkidd1@linux5 ~/work/ 
$ ./hw11translate2Ascii
5A 6C 0A 1B 2C 3D 4E 5F
 
tkidd1@linux5 ~/work/ 
$
```

# How to Run
option 1:
``` 
sh run.sh
```
option2 :
```
nasm -f elf32 hw11translate2Ascii.asm -o hw11translate2Ascii.o
ld -m elf_i386 hw11translate2Ascii.o -o hw11translate2Ascii
./hw11translate2Ascii
```



# CMSC313-Has
