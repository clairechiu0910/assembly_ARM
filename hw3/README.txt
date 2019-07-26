先mov一個數字給r0, 再把r1設成#-1。
compare r0 and #0, if (r0 > #0) r2=r0*r1(#-1).
if(r0 >= #0) r2=r0

用arm-elf-gcc編譯程式(arm-elf-gcc -g -O0 hw3.s -o hw3.exe)

在terminal輸入arm-elf-insight -tui開啟GDB Command-Line Mode(下方可以輸入指令，上方顯示sourse code和執行到哪一行)
在下方(gdb)輸入file hw3.exe開啟hw3.exe
(gdb)target sim連接simulator
(gdb)load hw3.exe，在load的狀態輸出一頁後，輸入<return>繼續load到結束，回到(gdb)輸入
在第5、6、7、8、9設breakpoint
輸入r執行，執行每一行後可以輸入info registers輸出所有register的值
也可以在執行line 5後，再把r0設成其他的值(set $r0=?), 最後r2的值會是執行(line 8 or line 9)之前的r0的值，但會依據line 7 compare的結果決定執行line 8 or line 9 
執行完後，輸入quit離開GDB
