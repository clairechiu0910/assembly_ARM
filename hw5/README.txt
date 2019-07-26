一開始先把兩個數放到r0, r1裡，再判斷r0, r1是否相等。如果相等，gdb(r0,r1)=r0; 如果不相等，持續運算if(r0>r1)r0-=r1, if(r1>r0)r1-=r0到r0=r1，r0的值就是gdb(r0,r1)
在terminal輸入make編譯，打開arm-elf-insight執行。也可以在執行的register視窗更改r0, r1
