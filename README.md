環境安裝:2019-https://www.dcard.tw/f/fju/p/234561890/	2017-https://www.pianshen.com/article/4631256212/

vis:https://visualstudio.microsoft.com/zh-hant/downloads/

Irvine32-x86:http://asmirvine.com/gettingStartedVS2017/index.htm

起始碼:

.386

.model flat,stdcall

.stack 4096

ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc					;帶入Irvine32

.code

main proc;

	xor eax,eax					;讓eax佔存器歸0
	xor edx,edx					;讓edx佔存器歸0
	mov eax,0					;設定edx設為0
	mov edx,0					;設定edx設為0
	add eax,5					;將5的值存入eax
	add edx,5					;將5的值存入edx
	call DumpRegs					;印出暫存器的值


main endp

end main
