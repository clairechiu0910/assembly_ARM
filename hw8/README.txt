和全部用C寫的大部分一樣, 先用fscanf儲存全部的資料到a, b, c matrix裡。再用__m128* pointer指到a, b, c, 用_mm_mul_ps執行a*b和a*c, 存到tmp裡, 再加到ans裡, 每執行完一行就print出ans。最後執行完程式print出執行時間(單位:s)
在工作站input 
gcc hw8.c -o hw8.exe
gcc hw8simd.c -o hw8simd.exe 編譯, 
input
./hw8.exe
./hw8simd.exe 執行

使用工作站編譯、執行。
hw8.c: 
0.031250 sec
hw8simd.c:
0.023438 sec
可能因為使用的時間函數沒有辦法算到很精確, 這個程式執行的data大小也沒有很大，所以相差的時間沒有到很大。