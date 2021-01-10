INCLUDE Irvine32.inc
INCLUDE Macros.inc 
;--------------------------------------------------------------------------------------------------------------------------------------快轉畫面指令
;----------------------------------------------------------------------------------美術畫面(menu)
;----------------------------------------------------------------------------------美術畫面(team)
;----------------------------------------------------------------------------------美術畫面(gameover)
;----------------------------------------------------------------------------------美術畫面(rule)
;----------------------------------------------------------------------------------美術畫面(coloerset)
;----------------------------------------------------------------------------------美術畫面(win)
;-----------------------------------------------------------------------------------------------------------------------------------------------CODE
;----------------------------------------------------------------------------------遊戲畫面(menu1)
;----------------------------------------------------------------------------------遊戲畫面(menu2)
;----------------------------------------------------------------------------------遊戲畫面(menu3)
;----------------------------------------------------------------------------------遊戲畫面(menu4)
;----------------------------------------------------------------------------------遊戲畫面(team29)
;----------------------------------------------------------------------------------遊戲畫面(team29T)
;-----------------------------------畫面跳轉
;----------------------------------------------------------------------------------遊戲運行(EASY)
;----------------------------------------------------------------------------------TOD0:遊戲運行(普通)
;----------------------------------------------------------------------------------遊戲運行(困難)
;-----------------------------------產生敵人
;-----------------------------------顯示分數
;-----------------------------------困難調整
;-----------------------------------操作系統
;-----------------------------------畫面跳轉
;----------------------------------------------------------------------------------遊戲畫面(overE1)
;----------------------------------------------------------------------------------遊戲畫面(overE2)
;----------------------------------------------------------------------------------遊戲畫面(overE3)
;----------------------------------------------------------------------------------遊戲畫面(overH1)
;----------------------------------------------------------------------------------遊戲畫面(overH2)
;----------------------------------------------------------------------------------遊戲畫面(overh3)
;----------------------------------------------------------------------------------遊戲畫面(overN1)
;----------------------------------------------------------------------------------遊戲畫面(overN2)
;----------------------------------------------------------------------------------遊戲畫面(overN3)
;-----------------------------------輸出分數
;-----------------------------------畫面跳轉	
;----------------------------------------------------------------------------------遊戲畫面(rule1)
;----------------------------------------------------------------------------------遊戲畫面(rule2)
;----------------------------------------------------------------------------------遊戲畫面(rule3)
;----------------------------------------------------------------------------------遊戲畫面(ruleb)
;----------------------------------------------------------------------------------遊戲畫面(colorset-yellow)
;----------------------------------------------------------------------------------遊戲畫面(colorset-while)
;----------------------------------------------------------------------------------遊戲畫面(colorset-back)
;-----------------------------------畫面跳轉	
;----------------------------------------------------------------------------------遊戲畫面(win1)
;----------------------------------------------------------------------------------遊戲畫面(win2)
;----------------------------------------------------------------------------------遊戲畫面(win3)

;-----------------------------------------------------------------------------------------------------------------------------------------------DATA
.DATA
	a WORD 2920 DUP(0)  ;緩衝區 
;----------------------------------------------------------------------------------遊戲資料
	flag BYTE 0
	airplaneX BYTE 1
	airplaneY BYTE 20
	foe1X BYTE ?
	foe1Y BYTE ?
	foe2X BYTE ?
	foe2Y BYTE ?
	foe3X BYTE ?
	foe3Y BYTE ?
	foe1_flag BYTE ?
	foe2_flag BYTE ?
	foe3_flag BYTE ?
	new_foe1 DWORD ?
	new_foe2 DWORD ?
	new_foe3 DWORD ?
	bulletX BYTE ?
	bulletY BYTE ?
	gameblock BYTE"==========================================",0DH,0AH,0
	straight BYTE "|                                        |",0DH,0AH,0
	score  DWORD 0
;----------------------------------------------------------------------------------美術畫面(menu)
menuP01   BYTE "====================================================", 0Dh, 0Ah,0
menuP02   BYTE "|                                                  |", 0Dh, 0Ah,0
menuP03   BYTE "|       -   ----     ------------     -   -- -     |", 0Dh, 0Ah,0
menuP04   BYTE "|     ----    -         -  -   -     ----  -- -    |", 0Dh, 0Ah,0
menuP05   BYTE "|       -     -      ----  -   --     -   -- -     |", 0Dh, 0Ah,0
menuP06   BYTE "|       -     -         -  -   -     ----  -- -    |", 0Dh, 0Ah,0
menuP07   BYTE "|       --    -      ------------    -- -------    |", 0Dh, 0Ah,0
menuP08   BYTE "|     ---     -         -  -   -      - --  -      |", 0Dh, 0Ah,0
menuP09   BYTE "|       -     -         -  -   --     - -   -- -   |", 0Dh, 0Ah,0
menuP10   BYTE "|       -    --      --    -    --    --   - ---   |", 0Dh, 0Ah,0
menuP11   BYTE "|                                                  |", 0Dh, 0Ah,0
menuP12   BYTE "|                                                  |", 0Dh, 0Ah,0
menuP13   BYTE "|                  --> 開始遊戲                    |", 0Dh, 0Ah,0
menuP14   BYTE "|                                                  |", 0Dh, 0Ah,0
menuP15   BYTE "|                      設定顏色(待開發)            |", 0Dh, 0Ah,0
menuP16   BYTE "|                                                  |", 0Dh, 0Ah,0
menuP17   BYTE "|                      結束遊戲                    |", 0Dh, 0Ah,0
menuP18   BYTE "|                                                  |", 0Dh, 0Ah,0
menuP19   BYTE "|                                  方向鍵 移動選單 |", 0Dh, 0Ah,0
menuP20   BYTE "|                                 ENTER鍵 確定選單 |", 0Dh, 0Ah,0
menuP21   BYTE "|更新日期:21/01/10                                 |", 0Dh, 0Ah,0
menuP22   BYTE "====================================================", 0Dh, 0Ah,0
menuP23   BYTE "|                      開始遊戲                    |", 0Dh, 0Ah,0
menuP24   BYTE "|                  --> 設定顏色(待開發)            |", 0Dh, 0Ah,0
menuP25   BYTE "|                  --> 結束遊戲                    |", 0Dh, 0Ah,0
menuP26   BYTE "|                  --> 製作名單                    |", 0Dh, 0Ah,0
;----------------------------------------------------------------------------------美術畫面(team)
teamP01   BYTE "====================================================", 0Dh, 0Ah,0
teamP02   BYTE "| -                                                |", 0Dh, 0Ah,0
teamP03   BYTE "|---      ---      --                    -     --- |", 0Dh, 0Ah,0
teamP04   BYTE "| -      -   -        -     ---- -      -  -   -  -|", 0Dh, 0Ah,0
teamP05   BYTE "| - -    -----   - -- -     -  -  -       -    ----|", 0Dh, 0Ah,0
teamP06   BYTE "| - -    -       -    -     -  -  -      -       - |", 0Dh, 0Ah,0
teamP07   BYTE "|  -       --      --   -   -  -  -     ----    -  |", 0Dh, 0Ah,0
teamP08   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP09   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP10   BYTE "|       製作人員:                                  |", 0Dh, 0Ah,0
teamP11   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP12   BYTE "|           408262703曾博暘(其他畫面和遊戲難度)    |", 0Dh, 0Ah,0
teamP13   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP14   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP15   BYTE "|           407040093邱妍瑛(主遊戲開發)            |", 0Dh, 0Ah,0
teamP16   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP17   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP18   BYTE "|                --> 返回首頁 <--                  |", 0Dh, 0Ah,0
teamP19   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP20   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP21   BYTE "|下鍵 Without You                    空白鍵 回首頁 |", 0Dh, 0Ah,0
teamP22   BYTE "====================================================", 0Dh, 0Ah,0
teamP23   BYTE "|    I'm still the same 都好像沒有變               |", 0Dh, 0Ah,0
teamP24   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP25   BYTE "|         Nothing changed 還是討厭下雨天           |", 0Dh, 0Ah,0
teamP26   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP27   BYTE "|              還是不愛認錯 脾氣是硬了點           |", 0Dh, 0Ah,0
teamP28   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP29   BYTE "|                   這我都清楚 但我沒有辦法改變    |", 0Dh, 0Ah,0
teamP30   BYTE "|                                                  |", 0Dh, 0Ah,0
;----------------------------------------------------------------------------------美術畫面(gameover)
overP01   BYTE "====================================================", 0Dh, 0Ah,0
overP02   BYTE "|  ---------    ------    -----------   ---------  |", 0Dh, 0Ah,0
overP03   BYTE "|  --          --    --   --   -   --   --         |", 0Dh, 0Ah,0
overP04   BYTE "|  --    ---   --    --   --   -   --   ---------  |", 0Dh, 0Ah,0
overP05   BYTE "|  --     --   --------   --   -   --   --         |", 0Dh, 0Ah,0
overP06   BYTE "|  ---------   --    --   --   -   --   ---------  |", 0Dh, 0Ah,0
overP07   BYTE "|                                                  |", 0Dh, 0Ah,0
overP08   BYTE "|   -------    --       --  ---------   ---------  |", 0Dh, 0Ah,0
overP09   BYTE "| --       --   --     --   --          --     --  |", 0Dh, 0Ah,0
overP10   BYTE "| --       --    --   --    ---------   ---------  |", 0Dh, 0Ah,0
overP11   BYTE "| --       --     -- --     --          --  --     |", 0Dh, 0Ah,0
overP12   BYTE "|   -------        --       ---------   --    ---  |", 0Dh, 0Ah,0
overP13   BYTE "|                                                  |", 0Dh, 0Ah,0
overP14   BYTE "|        你的分數:                                 |", 0Dh, 0Ah,0
overP15   BYTE "|                                                  |", 0Dh, 0Ah,0
overP16   BYTE "|               --> 重新遊戲(簡單)                 |", 0Dh, 0Ah,0
overP17   BYTE "|                                                  |", 0Dh, 0Ah,0
overP18   BYTE "|                   選擇難度                       |", 0Dh, 0Ah,0
overP19   BYTE "|                                                  |", 0Dh, 0Ah,0
overP20   BYTE "|                   返回首頁                       |", 0Dh, 0Ah,0
overP21   BYTE "|                                                  |", 0Dh, 0Ah,0
overP22   BYTE "====================================================", 0Dh, 0Ah,0
overP24   BYTE "|               --> 選擇難度                       |", 0Dh, 0Ah,0
overP25   BYTE "|               --> 返回首頁                       |", 0Dh, 0Ah,0
overP23   BYTE "|                   重新遊戲(簡單)                 |", 0Dh, 0Ah,0
overP26   BYTE "|                   重新遊戲(普通)                 |", 0Dh, 0Ah,0
overP27   BYTE "|               --> 重新遊戲(普通)                 |", 0Dh, 0Ah,0
overP28   BYTE "|                   重新遊戲(困難)                 |", 0Dh, 0Ah,0
overP29   BYTE "|               --> 重新遊戲(困難)                 |", 0Dh, 0Ah,0
;----------------------------------------------------------------------------------美術畫面(規則)
ruleP01   BYTE "====================================================", 0Dh, 0Ah,0
ruleP02   BYTE "|                                                  |", 0Dh, 0Ah,0
ruleP03   BYTE "|              -----       -----  - -              |", 0Dh, 0Ah,0
ruleP04   BYTE "|          -   -   -       -   -  -  -             |", 0Dh, 0Ah,0
ruleP05   BYTE "|         ---  -----       -----  -  -             |", 0Dh, 0Ah,0
ruleP06   BYTE "|          -   -   -       -   -     -             |", 0Dh, 0Ah,0
ruleP07   BYTE "|         ---  -----       -----     -             |", 0Dh, 0Ah,0
ruleP08   BYTE "|         - -   - -                  -             |", 0Dh, 0Ah,0
ruleP09   BYTE "|              -  --        - -    ---             |", 0Dh, 0Ah,0
ruleP10   BYTE "|                                                  |", 0Dh, 0Ah,0
ruleP11   BYTE "|2030年,人類汙染了地球後,乘坐著太空梭想要去污染其他|", 0Dh, 0Ah,0
ruleP12   BYTE "|星球,為了防止這個宇宙被破壞,為了保護宇宙的和平,貫 |", 0Dh, 0Ah,0
ruleP13   BYTE "|愛徹與真實的邪惡,可愛又迷人的外星腳色,我是啾啾丸. |", 0Dh, 0Ah,0
ruleP14   BYTE "|飛碟叫做啾啾鞋,啾啾鞋:逼逼,我們是穿梭在宇宙的正義 |", 0Dh, 0Ah,0
ruleP15   BYTE "|使者,殺死那些該死的人類吧。                       |", 0Dh, 0Ah,0
ruleP16   BYTE "|                                                  |", 0Dh, 0Ah,0
ruleP17   BYTE "|   玩法說明:   左右鍵 控制飛碟                    |", 0Dh, 0Ah,0
ruleP18   BYTE "|               空白鍵 發射死亡激光炮              |", 0Dh, 0Ah,0
ruleP19   BYTE "|                                                  |", 0Dh, 0Ah,0
ruleP20   BYTE "|    -->嬰兒模式     成人模式         回家         |", 0Dh, 0Ah,0
ruleP21   BYTE "|                                                  |", 0Dh, 0Ah,0
ruleP22   BYTE "====================================================", 0Dh, 0Ah,0
ruleP23   BYTE "|       嬰兒模式     成人模式     -->回家          |", 0Dh, 0Ah,0
ruleP24   BYTE "|	嬰兒模式  -->成人模式        回家          |", 0Dh, 0Ah,0
ruleP25   BYTE "|    -->將軍模式     成人模式        回家          |", 0Dh, 0Ah,0
;----------------------------------------------------------------------------------美術畫面(coloerset)
colorsetP01   BYTE "====================================================", 0Dh, 0Ah,0
colorsetP02   BYTE "|                                                  |", 0Dh, 0Ah,0
colorsetP03   BYTE "|       -   ----     ------------     -   -- -     |", 0Dh, 0Ah,0
colorsetP04   BYTE "|     ----    -         -  -   -     ----  -- -    |", 0Dh, 0Ah,0
colorsetP05   BYTE "|       -     -      ----  -   --     -   -- -     |", 0Dh, 0Ah,0
colorsetP06   BYTE "|       -     -         -  -   -     ----  -- -    |", 0Dh, 0Ah,0
colorsetP07   BYTE "|       --    -      ------------    -- -------    |", 0Dh, 0Ah,0
colorsetP08   BYTE "|     ---     -         -  -   -      - --  -      |", 0Dh, 0Ah,0
colorsetP09   BYTE "|       -     -         -  -   --     - -   -- -   |", 0Dh, 0Ah,0
colorsetP10   BYTE "|       -    --      --    -    --    --   - ---   |", 0Dh, 0Ah,0
colorsetP11   BYTE "|                                                  |", 0Dh, 0Ah,0
colorsetP12   BYTE "|                                                  |", 0Dh, 0Ah,0
colorsetP13   BYTE "|                  --> 黃色模式                    |", 0Dh, 0Ah,0
colorsetP14   BYTE "|                                                  |", 0Dh, 0Ah,0
colorsetP15   BYTE "|                      藍色模式                    |", 0Dh, 0Ah,0
colorsetP16   BYTE "|                                                  |", 0Dh, 0Ah,0
colorsetP17   BYTE "|                      返回首頁                    |", 0Dh, 0Ah,0
colorsetP18   BYTE "|                                  方向鍵 移動選單 |", 0Dh, 0Ah,0
colorsetP19   BYTE "|                                                  |", 0Dh, 0Ah,0
colorsetP20   BYTE "|                                  空白鍵 確定選單 |", 0Dh, 0Ah,0
colorsetP21   BYTE "|                                                  |", 0Dh, 0Ah,0
colorsetP22   BYTE "====================================================", 0Dh, 0Ah,0
colorsetP23   BYTE "|                  --> 藍色模式                    |", 0Dh, 0Ah,0
colorsetP24   BYTE "|                      黃色模式                    |", 0Dh, 0Ah,0
colorsetP25   BYTE "|                  --> 返回首頁                    |", 0Dh, 0Ah,0
;----------------------------------------------------------------------------------美術畫面(win)
winP01   BYTE "====================================================", 0Dh, 0Ah,0
winP02   BYTE "|                                                  |", 0Dh, 0Ah,0
winP03   BYTE "|                                                  |", 0Dh, 0Ah,0
winP04   BYTE "|      -------------   -      ------------         |", 0Dh, 0Ah,0
winP05   BYTE "|                     -               ---          |", 0Dh, 0Ah,0
winP06   BYTE "|            --      -               ---           |", 0Dh, 0Ah,0
winP07   BYTE "|           --                     ---             |", 0Dh, 0Ah,0
winP08   BYTE "|          --                      ---             |", 0Dh, 0Ah,0
winP09   BYTE "|         --                       ---             |", 0Dh, 0Ah,0
winP10   BYTE "|        -----------             -----             |", 0Dh, 0Ah,0
winP11   BYTE "|                                                  |", 0Dh, 0Ah,0
winP12   BYTE "|                                                  |", 0Dh, 0Ah,0
;-----------------------------------輸出分數-------------------------------------
winP14   BYTE "|                                                  |", 0Dh, 0Ah,0
winP15   BYTE "|                                                  |", 0Dh, 0Ah,0
winP16   BYTE "|                --> 難度選單		           |", 0Dh, 0Ah,0
winP17   BYTE "|                                                  |", 0Dh, 0Ah,0
winP18   BYTE "|                    返回首頁	                   |", 0Dh, 0Ah,0
winP19   BYTE "|                                                  |", 0Dh, 0Ah,0
winP20   BYTE "|                    結束遊戲	                   |", 0Dh, 0Ah,0
winP21   BYTE "|                                                  |", 0Dh, 0Ah,0
winP22   BYTE "====================================================", 0Dh, 0Ah,0

winP23   BYTE "|                    難度選單		           |", 0Dh, 0Ah,0

winP24   BYTE "|                --> 返回首頁                      |", 0Dh, 0Ah,0

winP25   BYTE "|                --> 結束遊戲		           |", 0Dh, 0Ah,0

;-----------------------------------------------------------------------------------------------------------------------------------------------CODE
.CODE
main PROC
		mov eax,lightblue
		call setTextColor
		call menu1
main ENDP
;----------------------------------------------------------------------------------遊戲運行(成人)
gameN PROC
	mov flag,0
	mov airplaneX,1
	mov airplaneY,20
;-----------------------------------產生敵人
	.WHILE foe1X == 0
		call RandomRange
			.IF eax > 5 && eax < 38
				mov foe1X,al
				sub al,3
				mov foe2X,al
				add al,7
				mov foe3X,al
			.ENDIF
	.endw
	mov foe1Y,1
	mov foe2Y,2
	mov foe3Y,3
	mov foe1_flag,0
	mov foe2_flag,0
	mov foe3_flag,0
	mov score,0
	call Clrscr
	mov edx,offset gameblock
	call writestring
	mov edx,offset straight
	mov ecx,20
;-----------------------------------顯示分數
	L1:
		call writestring
	Loop L1
	mov edx,offset gameblock
	call writestring
	mGotoxy 50,2
	mwrite "======SCORE======"
	mGotoxy 50,3
	mwrite "|               |"
	mGotoxy 50,4
	mwrite "================="
;-----------------------------------

	lo:
		mGotoxy 0,0
		push dx
		mov dl,42
		mov dh,4
		call gotoxy
		
		mov dl,57
		mov dh,3
		call gotoxy
		mov eax,score
		call writedec
		pop dx
;-----------------------------------困難調整
		.IF score < 300
			mov eax,30
		.ELSEIF score < 600
			mov eax,25	;12
		.ELSEIF score < 900
			mov eax,20	;9
		.ELSEIF score < 1200
			mov eax,15	;8
		.ELSEIF score < 2000
			mov eax,10	;7
		.ELSE
			call win
		.ENDIF
;-----------------------------------
		call delay
		call gotoxy
		mov al,' '
		call writechar
		.IF flag==1
			mov dl,bulletX
			mov dh,bulletY
			mov al,' '
			mov eax,yellow
			call setTextColor
			call gotoXY
			call writechar
			dec dh
			dec bulletY
			.IF dh != 0
				.IF dh > 16
					mov al,'.'
				.ELSE
					mov al,'|'
				.ENDIF
				call gotoXY
				call writechar
			.ELSE
				dec flag
			.ENDIF
		.ENDIF
		mov eax,lightblue
		call setTextColor
		.IF foe1_flag == 20
			mov dl,foe1X
			mov dh,foe1Y
			call gotoxy
			mov al,' '
			call writechar
			push eax
			mov eax,3
			call RandomRange
			mov new_foe1,eax
			pop eax
			inc foe1Y
			inc dh
			mov dl,foe1X
			call gotoxy
			mov al,'V'
			call writechar
			mov foe1_flag,5
			.IF	foe1Y > 20
				jmp los
			.ENDIF
		.ELSE 
			inc foe1_flag
		.ENDIF
		mov dl,foe1X
		mov dh,foe1Y
		.IF dl == bulletX && dh == bulletY
			add score,100
			call gotoxy
			mov al,' '
			call writechar
			mov foe1_flag,0
			mov foe1Y,1
			mov foe1X,15
			mov eax,30
			call RandomRange
			.IF eax >= 1 && eax <= 40
				mov foe1X,al
			.ENDIF
		.ENDIF
; -----------------------------------敵人2
		.IF foe2_flag == 20
			mov dl,foe2X
			mov dh,foe2Y
			call gotoxy
			mov al,' '
			call writechar
			push eax
			mov eax,3
			call RandomRange
			mov new_foe2,eax
			pop eax
			inc foe2Y
			mov dh,foe2Y
			mov dl,foe2X
			call gotoxy
			mov al,'V'
			call writechar
			mov foe2_flag,5
			.IF	foe2Y > 20
				jmp los
			.ENDIF
		.ELSE 
			inc foe2_flag
		.ENDIF
		mov dl,foe2X
		mov dh,foe2Y
		.IF dl == bulletX && dh == bulletY
			add score,100
			call gotoxy
			mov al,' '
			call writechar
			mov foe2_flag,0
			mov foe2Y,1
			mov foe2X,15
			mov eax,30
			call RandomRange
			.IF eax >= 1 && eax <= 40
				mov foe2X,al
			.ENDIF
		.ENDIF
; -----------------------------------敵人3
		.IF foe3_flag == 20
			mov dl,foe3X
			mov dh,foe3Y
			call gotoxy
			mov al,' '
			call writechar
			push eax
			mov eax,3
			call RandomRange
			mov new_foe3,eax
			pop eax
			inc foe3Y
			mov dh,foe3Y
			mov dl,foe3X
			call gotoxy
			mov al,'V'
			call writechar
			mov foe3_flag,5
			.IF	foe3Y > 20
				jmp los
			.ENDIF
		.ELSE 
			inc foe3_flag
		.ENDIF
		mov dl,foe3X
		mov dh,foe3Y
		.IF dl == bulletX && dh == bulletY
			add score,100
			call gotoxy
			mov al,' '
			call writechar
			mov foe3_flag,0
			mov foe3Y,1
			mov foe3X,15
			mov eax,30
			call RandomRange
			.IF eax >= 1 && eax <= 40
				mov foe3X,al
			.ENDIF
		.ENDIF
;-----------------------------------操作系統
		call readkey		;非功能鍵存al 功能鍵ah
		.IF (ah == 4bh) && airplaneX != 1 ;左鍵
			dec airplaneX
		.ELSEIF (ah == 4dh) && airplaneX != 40 ;右鍵
			inc airplaneX
		.ELSEIF (al == ' ') && flag==0 ;空白鍵
			mov dl,airplaneX
			mov dh,airplaneY
			dec dh
			mov bulletX,dl
			mov bulletY,dh
			call Gotoxy
			mov eax,yellow
			call setTextColor
			mov al,'.'
			call writechar
			inc flag
		.ENDIF
;-----------------------------------		
		mov dl,airplaneX
		mov dh,airplaneY
		call gotoXY
		mov al,'U'
		call writechar
		jmp lo
		los:
			call overN1
gameN ENDP
;----------------------------------------------------------------------------------遊戲運行(嬰兒)
gameE PROC
	mov flag,0
	mov airplaneX,1
	mov airplaneY,20
;-----------------------------------產生敵人
	.WHILE foe1X == 0
		call RandomRange
			.IF eax > 1 && eax < 40
				mov foe1X,al
			.ENDIF
	.endw
	mov foe1Y,1
	mov foe1_flag,0
	mov score,0
	call Clrscr
	mov edx,offset gameblock
	call writestring
	mov edx,offset straight
	mov ecx,20
;-----------------------------------顯示分數
	L1:
		call writestring
	Loop L1
	mov edx,offset gameblock
	call writestring
	mGotoxy 50,2
	mwrite "======SCORE======"
	mGotoxy 50,3
	mwrite "|               |"
	mGotoxy 50,4
	mwrite "================="
;-----------------------------------

	lo:
		mGotoxy 0,0
		push dx
		mov dl,42
		mov dh,4
		call gotoxy
		mov dl,57
		mov dh,3
		call gotoxy
		mov eax,score
		call writedec
		pop dx
;-----------------------------------困難調整
		.IF score < 300
			mov eax,30
		.ELSEIF score < 600
			mov eax,25	;12
		.ELSEIF score < 900
			mov eax,20	;9
		.ELSEIF score < 1200
			mov eax,15	;8
		.ELSEIF score < 2000
			mov eax,10	;7
		.ELSE
			call win
		.ENDIF
;-----------------------------------
		call delay
		call gotoxy
		mov al,' '
		call writechar
		.IF flag==1
			mov dl,bulletX
			mov dh,bulletY
			mov al,' '
			call gotoXY
			mov eax,yellow
			call setTextColor
			call writechar
			dec dh
			dec bulletY
			.IF dh != 0
				.IF dh > 16
					mov al,'.'
				.ELSE
					mov al,'|'
				.ENDIF
				call gotoXY
				call writechar
			.ELSE
				dec flag
			.ENDIF
		.ENDIF
		mov eax,lightblue
		call setTextColor
		.IF foe1_flag == 20
			mov dl,foe1X
			mov dh,foe1Y
			call gotoxy
			mov al,' '
			call writechar
			push eax
			mov eax,3
			call RandomRange
			mov new_foe1,eax
			pop eax
			inc foe1Y
			inc dh
			mov dl,foe1X
			call gotoxy
			mov al,'V'
			call writechar
			mov foe1_flag,5
			.IF	foe1Y>20
				jmp los
			.ENDIF
		.ELSE 
			inc foe1_flag
		.ENDIF
		mov dl,foe1X
		mov dh,foe1Y
		.IF dl == bulletX && dh == bulletY
			add score,100
			call gotoxy
			mov al,' '
			call writechar
			mov foe1_flag,0
			mov foe1Y,1
			mov foe1X,15
			mov eax,30
			call RandomRange
			.IF eax >= 1 && eax <= 40
				mov foe1X,al
			.ENDIF
		.ENDIF
;-----------------------------------操作系統
		call readkey		;非功能鍵存al 功能鍵ah
		.IF (ah == 4bh) && airplaneX != 1 ;左鍵
			dec airplaneX
		.ELSEIF (ah == 4dh) && airplaneX != 40 ;右鍵
			inc airplaneX
		.ELSEIF (al == ' ') && flag==0 ;空白鍵
			mov dl,airplaneX
			mov dh,airplaneY
			dec dh
			mov bulletX,dl
			mov bulletY,dh
			call gotoxy
			mov al,'.'
			mov eax,yellow
			call setTextColor
			call writechar
			inc flag
		.ENDIF
;-----------------------------------		
		mov dl,airplaneX
		mov dh,airplaneY
		call gotoXY
		mov al,'U'
		call writechar
		jmp lo
		los:
			call overE1
gameE ENDP
;----------------------------------------------------------------------------------遊戲運行(困難)
gameh PROC
	mov flag,0
	mov airplaneX,1
	mov airplaneY,20
	mov foe1X,15
	mov foe1Y,1
	mov foe1_flag,0
	mov score,0
	call Clrscr
	mov edx,offset gameblock
	call writestring
	mov edx,offset straight
	mov ecx,20
;-----------------------------------顯示分數
	L1:
		call writestring
	Loop L1
	mov edx,offset gameblock
	call writestring
	mGotoxy 50,2
	mwrite "======SCORE======"
	mGotoxy 50,3
	mwrite "|               |"
	mGotoxy 50,4
	mwrite "================="
;-----------------------------------
	lo:
		mGotoxy 0,0
		push dx
		mov dl,56
		mov dh,3
		call gotoxy
		mov eax,score
		call writedec
		pop dx
;-----------------------------------困難調整
		.IF score < 300
			mov eax,30
		.ELSEIF score < 600
			mov eax,25	;12
		.ELSEIF score < 900
			mov eax,20	;9
		.ELSEIF score < 1200
			mov eax,15	;8
		.ELSEIF score < 2000
			mov eax,10	;7
		.ELSE
			call win
		.ENDIF
;-----------------------------------
		call delay
		call gotoxy
		mov al,' '
		call writechar
		.IF flag==1
			mov dl,bulletX
			mov dh,bulletY
			mov al,' '
			call gotoXY
			call writechar
			dec dh
			dec bulletY
			.IF dh != 0
				.IF dh > 16
					mov al,'.'
				.ELSE
					mov al,'|'
				.ENDIF
				call gotoXY
				call writechar
			.ELSE
				dec flag
			.ENDIF
		.ENDIF
		.IF foe1_flag==20
			mov dl,foe1X
			mov dh,foe1Y
			call gotoxy
			mov al,' '
			call writechar
			push eax
			mov eax,3
			call RandomRange
			mov new_foe1,eax
			.IF new_foe1==0
				.IF foe1X!=1
				dec foe1X 
				.ENDIF
			.ELSEIF new_foe1==2
				.IF foe1X!=30
					inc foe1X 
				.ENDIF
			.ENDIF
			pop eax
			inc foe1Y
			inc dh
			mov dl,foe1X
			call gotoxy
			mov al,'V'
			call writechar
			mov foe1_flag,5
			.IF	foe1Y>20
				jmp los
			.ENDIF
		.ELSE 
			inc foe1_flag
		.ENDIF
		mov dl,foe1X
		mov dh,foe1Y
		.IF dl==bulletX && dh== bulletY
			add score,100
			call gotoxy
			mov al,' '
			call writechar
			mov foe1_flag,0
			mov foe1Y,1
			mov foe1X,15
			mov eax,30
			call RandomRange
			.IF eax>=1 && eax <=30
				mov foe1X,al
			.ENDIF
		.ENDIF
;-----------------------------------操作系統

		call readkey		;非功能鍵存al 功能鍵ah
		.IF (ah == 4bh) && airplaneX != 1 ;左鍵
			dec airplaneX
		.ELSEIF (ah == 4dh) && airplaneX != 40 ;右鍵
			inc airplaneX
		.ELSEIF (al == ' ') && flag==0 ;空白鍵
			mov dl,airplaneX
			mov dh,airplaneY
			dec dh
			mov bulletX,dl
			mov bulletY,dh
			call gotoxy
			mov al,'.'
			mov eax,yellow
			call setTextColor
			call writechar
			inc flag
		.ENDIF
;-----------------------------------
		mov dl,airplaneX
		mov dh,airplaneY
		call gotoXY
		mov al,'U'
		call writechar
		jmp lo
		los:
			call overH1
gameh ENDP
;----------------------------------------------------------------------------------遊戲畫面(menu1)
menu1 PROC
		call Clrscr
		 MOV EDX, OFFSET menuP01
		 CALL WriteString
		 MOV EDX, OFFSET menuP02
		 CALL WriteString
		 MOV EDX, OFFSET menuP03
		 CALL WriteString
		 MOV EDX, OFFSET menuP04
		 CALL WriteString
		 MOV EDX, OFFSET menuP05
		 CALL WriteString
		 MOV EDX, OFFSET menuP06
		 CALL WriteString
		 MOV EDX, OFFSET menuP07
		 CALL WriteString
		 MOV EDX, OFFSET menuP08
		 CALL WriteString
		 MOV EDX, OFFSET menuP09
		 CALL WriteString
		 MOV EDX, OFFSET menuP10
		 CALL WriteString
		 MOV EDX, OFFSET menuP11
		 CALL WriteString
		 MOV EDX, OFFSET menuP12
		 CALL WriteString
		 MOV EDX, OFFSET menuP13
		 CALL WriteString
		 MOV EDX, OFFSET menuP14
		 CALL WriteString
		 MOV EDX, OFFSET menuP15
		 CALL WriteString
		 MOV EDX, OFFSET menuP16
		 CALL WriteString
		 MOV EDX, OFFSET menuP17
		 CALL WriteString
		 MOV EDX, OFFSET menuP18
		 CALL WriteString
		 MOV EDX, OFFSET menuP19
		 CALL WriteString
		 MOV EDX, OFFSET menuP20
		 CALL WriteString
		 MOV EDX, OFFSET menuP21
		 CALL WriteString
		 MOV EDX, OFFSET menuP22
		 CALL WriteString
;-----------------------------------畫面跳轉
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') 
				call rule		;規則說明
			.ELSEIF ah == 50h
				call menu2		;設定顏色
			.ELSEIF ah == 48h
				call menu3		;結束遊戲
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')
menu1 ENDP
;----------------------------------------------------------------------------------遊戲畫面(menu2)
menu2 PROC
		call Clrscr
		 MOV EDX, OFFSET menuP01
		 CALL WriteString
		 MOV EDX, OFFSET menuP02
		 CALL WriteString
		 MOV EDX, OFFSET menuP03
		 CALL WriteString
		 MOV EDX, OFFSET menuP04
		 CALL WriteString
		 MOV EDX, OFFSET menuP05
		 CALL WriteString
		 MOV EDX, OFFSET menuP06
		 CALL WriteString
		 MOV EDX, OFFSET menuP07
		 CALL WriteString
		 MOV EDX, OFFSET menuP08
		 CALL WriteString
		 MOV EDX, OFFSET menuP09
		 CALL WriteString
		 MOV EDX, OFFSET menuP10
		 CALL WriteString
		 MOV EDX, OFFSET menuP11
		 CALL WriteString
		 MOV EDX, OFFSET menuP12
		 CALL WriteString
		 MOV EDX, OFFSET menuP23
		 CALL WriteString
		 MOV EDX, OFFSET menuP14
		 CALL WriteString
		 MOV EDX, OFFSET menuP24
		 CALL WriteString
		 MOV EDX, OFFSET menuP16
		 CALL WriteString
		 MOV EDX, OFFSET menuP17
		 CALL WriteString
		 MOV EDX, OFFSET menuP18
		 CALL WriteString
		 MOV EDX, OFFSET menuP19
		 CALL WriteString
		 MOV EDX, OFFSET menuP20
		 CALL WriteString
		 MOV EDX, OFFSET menuP21
		 CALL WriteString
		 MOV EDX, OFFSET menuP22
		 CALL WriteString
;-----------------------------------畫面跳轉
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') 
				call colorset	;顏色設定
			.ELSEIF ah == 50h
				call menu3		;結束遊戲
			.ELSEIF ah == 48h
				call menu1		;開始遊戲
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')
menu2 ENDP
;----------------------------------------------------------------------------------遊戲畫面(menu3)
menu3 PROC
		call Clrscr
		 MOV EDX, OFFSET menuP01
		 CALL WriteString
		 MOV EDX, OFFSET menuP02
		 CALL WriteString
		 MOV EDX, OFFSET menuP03
		 CALL WriteString
		 MOV EDX, OFFSET menuP04
		 CALL WriteString
		 MOV EDX, OFFSET menuP05
		 CALL WriteString
		 MOV EDX, OFFSET menuP06
		 CALL WriteString
		 MOV EDX, OFFSET menuP07
		 CALL WriteString
		 MOV EDX, OFFSET menuP08
		 CALL WriteString
		 MOV EDX, OFFSET menuP09
		 CALL WriteString
		 MOV EDX, OFFSET menuP10
		 CALL WriteString
		 MOV EDX, OFFSET menuP11
		 CALL WriteString
		 MOV EDX, OFFSET menuP12
		 CALL WriteString
		 MOV EDX, OFFSET menuP23
		 CALL WriteString
		 MOV EDX, OFFSET menuP14
		 CALL WriteString
		 MOV EDX, OFFSET menuP15
		 CALL WriteString
		 MOV EDX, OFFSET menuP16
		 CALL WriteString
		 MOV EDX, OFFSET menuP25
		 CALL WriteString
		 MOV EDX, OFFSET menuP18
		 CALL WriteString
		 MOV EDX, OFFSET menuP19
		 CALL WriteString
		 MOV EDX, OFFSET menuP20
		 CALL WriteString
		 MOV EDX, OFFSET menuP21
		 CALL WriteString
		 MOV EDX, OFFSET menuP22
		 CALL WriteString
;-----------------------------------畫面跳轉
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') 
				invoke ExitProcess,0 ;結束遊戲
			.ELSEIF ah == 50h	;下
				call menu1		;開始遊戲
			.ELSEIF ah == 48h	;上
				call menu2		;設定顏色
			.ELSEIF (ah == 4Dh)||(ah == 4Bh);左右
				call menu4		;製作名單
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')||(ah == 4Dh)||(ah == 4Bh)
menu3 ENDP
;----------------------------------------------------------------------------------遊戲畫面(menu4)
menu4 PROC
		call Clrscr
		 MOV EDX, OFFSET menuP01
		 CALL WriteString
		 MOV EDX, OFFSET menuP02
		 CALL WriteString
		 MOV EDX, OFFSET menuP03
		 CALL WriteString
		 MOV EDX, OFFSET menuP04
		 CALL WriteString
		 MOV EDX, OFFSET menuP05
		 CALL WriteString
		 MOV EDX, OFFSET menuP06
		 CALL WriteString
		 MOV EDX, OFFSET menuP07
		 CALL WriteString
		 MOV EDX, OFFSET menuP08
		 CALL WriteString
		 MOV EDX, OFFSET menuP09
		 CALL WriteString
		 MOV EDX, OFFSET menuP10
		 CALL WriteString
		 MOV EDX, OFFSET menuP11
		 CALL WriteString
		 MOV EDX, OFFSET menuP12
		 CALL WriteString
		 MOV EDX, OFFSET menuP23
		 CALL WriteString
		 MOV EDX, OFFSET menuP14
		 CALL WriteString
		 MOV EDX, OFFSET menuP15
		 CALL WriteString
		 MOV EDX, OFFSET menuP16
		 CALL WriteString
		 MOV EDX, OFFSET menuP26
		 CALL WriteString
		 MOV EDX, OFFSET menuP18
		 CALL WriteString
		 MOV EDX, OFFSET menuP19
		 CALL WriteString
		 MOV EDX, OFFSET menuP20
		 CALL WriteString
		 MOV EDX, OFFSET menuP21
		 CALL WriteString
		 MOV EDX, OFFSET menuP22
		 CALL WriteString
;-----------------------------------畫面跳轉
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') 
				call team29		;回首頁
			.ENDIF
		 .UNTIL	(al == 0Dh)||(al == ' ') 
menu4 ENDP
;----------------------------------------------------------------------------------遊戲畫面(team29)
team29 PROC
		 call Clrscr
		 MOV EDX, OFFSET teamP01
		 CALL WriteString
		 MOV EDX, OFFSET teamP02
		 CALL WriteString
		 MOV EDX, OFFSET teamP03
		 CALL WriteString
		 MOV EDX, OFFSET teamP04
		 CALL WriteString
		 MOV EDX, OFFSET teamP05
		 CALL WriteString
		 MOV EDX, OFFSET teamP06
		 CALL WriteString
		 MOV EDX, OFFSET teamP07
		 CALL WriteString
		 MOV EDX, OFFSET teamP08
		 CALL WriteString
		 MOV EDX, OFFSET teamP09
		 CALL WriteString
		 MOV EDX, OFFSET teamP10
		 CALL WriteString
		 MOV EDX, OFFSET teamP11
		 CALL WriteString
		 MOV EDX, OFFSET teamP12
		 CALL WriteString
		 MOV EDX, OFFSET teamP13
		 CALL WriteString
		 MOV EDX, OFFSET teamP14
		 CALL WriteString
		 MOV EDX, OFFSET teamP15
		 CALL WriteString
		 MOV EDX, OFFSET teamP16
		 CALL WriteString
		 MOV EDX, OFFSET teamP17
		 CALL WriteString
		 MOV EDX, OFFSET teamP18
		 CALL WriteString
		 MOV EDX, OFFSET teamP19
		 CALL WriteString
		 MOV EDX, OFFSET teamP20
		 CALL WriteString
		 MOV EDX, OFFSET teamP21
		 CALL WriteString
		 MOV EDX, OFFSET teamP22
		 CALL WriteString
;--------------------------------------跳轉
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ')
				call menu1
			.ELSEIF (ah == 50h)||(ah == 48h)
				CALL team29T 
			.ENDIF
		 .UNTIL	(al == 0Dh)||(al == ' ')||(ah == 48h)

team29 ENDP
;----------------------------------------------------------------------------------遊戲畫面(team29T)
team29T PROC
		 call Clrscr
		MOV EDX, OFFSET teamP01
		 CALL WriteString
		 MOV EDX, OFFSET teamP02
		 CALL WriteString
		 MOV EDX, OFFSET teamP03
		 CALL WriteString
		 MOV EDX, OFFSET teamP04
		 CALL WriteString
		 MOV EDX, OFFSET teamP05
		 CALL WriteString
		 MOV EDX, OFFSET teamP06
		 CALL WriteString
		 MOV EDX, OFFSET teamP07
		 CALL WriteString
		 MOV EDX, OFFSET teamP08
		 CALL WriteString
		 MOV EDX, OFFSET teamP09
		 CALL WriteString
		 MOV EDX, OFFSET teamP23
		 CALL WriteString
		 MOV EDX, OFFSET teamP24
		 CALL WriteString
		 MOV EDX, OFFSET teamP25
		 CALL WriteString
		 MOV EDX, OFFSET teamP26
		 CALL WriteString
		 MOV EDX, OFFSET teamP27
		 CALL WriteString
		 MOV EDX, OFFSET teamP28
		 CALL WriteString
		 MOV EDX, OFFSET teamP29
		 CALL WriteString
		 MOV EDX, OFFSET teamP30
		 CALL WriteString
		 MOV EDX, OFFSET teamP18
		 CALL WriteString
		 MOV EDX, OFFSET teamP19
		 CALL WriteString
		 MOV EDX, OFFSET teamP20
		 CALL WriteString
		 MOV EDX, OFFSET teamP21
		 CALL WriteString
		 MOV EDX, OFFSET teamP22
		 CALL WriteString
;-----------------------------------畫面跳轉
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ')
				call menu1
			.ENDIF
		 .UNTIL	(al == 0Dh)||(al == ' ')
team29T ENDP

;----------------------------------------------------------------------------------遊戲畫面(overE1)
overE1 PROC
		 call Clrscr
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		 MOV EDX, OFFSET overP13
		 CALL WriteString

;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP16
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP18
		 CALL WriteString
		 MOV EDX, OFFSET overP19
		 CALL WriteString
		 MOV EDX, OFFSET overP20
		 CALL WriteString
		 MOV EDX, OFFSET overP21
		 CALL WriteString
		 MOV EDX, OFFSET overP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call gameE
			.ELSEIF ah == 50h	;下
				call overE2
			.ELSEIF ah == 48h	;上
				call overE3
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')
overE1 ENDP


;----------------------------------------------------------------------------------遊戲畫面(overE2)
overE2 PROC
		 call Clrscr
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		 MOV EDX, OFFSET overP13
		 CALL WriteString

;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP23
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP24
		 CALL WriteString
		 MOV EDX, OFFSET overP19
		 CALL WriteString
		 MOV EDX, OFFSET overP20
		 CALL WriteString
		 MOV EDX, OFFSET overP21
		 CALL WriteString
		 MOV EDX, OFFSET overP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call rule
			.ELSEIF ah == 48h	;上
				call overE1
			.ELSEIF ah == 50h	;下
				call overE3
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')

overE2 ENDP

;----------------------------------------------------------------------------------遊戲畫面(overE3)
overE3 PROC
		 call Clrscr
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		 MOV EDX, OFFSET overP13
		 CALL WriteString

;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP23
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP18
		 CALL WriteString
		 MOV EDX, OFFSET overP19
		 CALL WriteString
		 MOV EDX, OFFSET overP25
		 CALL WriteString
		 MOV EDX, OFFSET overP21
		 CALL WriteString
		 MOV EDX, OFFSET overP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call menu1
			.ELSEIF ah == 50h	;下
				call overE1
			.ELSEIF ah == 48h	;上
				;call overE2
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')

overE3 ENDP

;----------------------------------------------------------------------------------遊戲畫面(overH1)
overH1 PROC
		 call Clrscr
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		 MOV EDX, OFFSET overP13
		 CALL WriteString

;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP29
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP18
		 CALL WriteString
		 MOV EDX, OFFSET overP19
		 CALL WriteString
		 MOV EDX, OFFSET overP20
		 CALL WriteString
		 MOV EDX, OFFSET overP21
		 CALL WriteString
		 MOV EDX, OFFSET overP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call gameH
			.ELSEIF ah == 50h	;下
				call overH2
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(al == ' ')
overH1 ENDP


;----------------------------------------------------------------------------------遊戲畫面(overH2)
overH2 PROC
		 call Clrscr
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		 MOV EDX, OFFSET overP13
		 CALL WriteString

;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP28
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP24
		 CALL WriteString
		 MOV EDX, OFFSET overP19
		 CALL WriteString
		 MOV EDX, OFFSET overP20
		 CALL WriteString
		 MOV EDX, OFFSET overP21
		 CALL WriteString
		 MOV EDX, OFFSET overP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call rule
			.ELSEIF ah == 48h	;上
				call overH1
			.ELSEIF ah == 50h	;下
				call overH3
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(al == ' ')

overH2 ENDP

;----------------------------------------------------------------------------------遊戲畫面(overh3)
overH3 PROC
		 call Clrscr
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		 MOV EDX, OFFSET overP13
		 CALL WriteString

;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP28
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP18
		 CALL WriteString
		 MOV EDX, OFFSET overP19
		 CALL WriteString
		 MOV EDX, OFFSET overP25
		 CALL WriteString
		 MOV EDX, OFFSET overP21
		 CALL WriteString
		 MOV EDX, OFFSET overP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call menu1
			.ELSEIF ah == 50h	;下
				call overH1
			.ELSEIF ah == 48h	;上
				;call overH2
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(al == ' ')

overH3 ENDP
;----------------------------------------------------------------------------------遊戲畫面(overN1)
overN1 PROC
		 call Clrscr
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		 MOV EDX, OFFSET overP13
		 CALL WriteString

;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP27
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP18
		 CALL WriteString
		 MOV EDX, OFFSET overP19
		 CALL WriteString
		 MOV EDX, OFFSET overP20
		 CALL WriteString
		 MOV EDX, OFFSET overP21
		 CALL WriteString
		 MOV EDX, OFFSET overP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call gameN
			.ELSEIF ah == 50h	;下
				call overN2
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(al == ' ')
overN1 ENDP
;----------------------------------------------------------------------------------遊戲畫面(overN2)
overN2 PROC
		 call Clrscr
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		 MOV EDX, OFFSET overP13
		 CALL WriteString

;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP26
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP24
		 CALL WriteString
		 MOV EDX, OFFSET overP19
		 CALL WriteString
		 MOV EDX, OFFSET overP20
		 CALL WriteString
		 MOV EDX, OFFSET overP21
		 CALL WriteString
		 MOV EDX, OFFSET overP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call rule
			.ELSEIF ah == 48h	;上
				call overN1
			.ELSEIF ah == 50h	;下
				call overN3
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(al == ' ')

overN2 ENDP

;----------------------------------------------------------------------------------遊戲畫面(overN3)
overN3 PROC
		 call Clrscr
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		 MOV EDX, OFFSET overP13
		 CALL WriteString

;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP26
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP18
		 CALL WriteString
		 MOV EDX, OFFSET overP19
		 CALL WriteString
		 MOV EDX, OFFSET overP25
		 CALL WriteString
		 MOV EDX, OFFSET overP21
		 CALL WriteString
		 MOV EDX, OFFSET overP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call menu1
			.ELSEIF ah == 50h	;下
				call overN1
			.ELSEIF ah == 48h	;上
				;call overN2
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(al == ' ')
overN3 ENDP
;----------------------------------------------------------------------------------遊戲畫面(rule1)
rule PROC
		 call Clrscr
		 MOV EDX, OFFSET ruleP01
		 CALL WriteString
		 MOV EDX, OFFSET ruleP02
		 CALL WriteString
		 MOV EDX, OFFSET ruleP03
		 CALL WriteString
		 MOV EDX, OFFSET ruleP04
		 CALL WriteString
		 MOV EDX, OFFSET ruleP05
		 CALL WriteString
		 MOV EDX, OFFSET ruleP06
		 CALL WriteString
		 MOV EDX, OFFSET ruleP07
		 CALL WriteString
		 MOV EDX, OFFSET ruleP08
		 CALL WriteString
		 MOV EDX, OFFSET ruleP09
		 CALL WriteString
		 MOV EDX, OFFSET ruleP10
		 CALL WriteString
		 MOV EDX, OFFSET ruleP11
		 CALL WriteString
		 MOV EDX, OFFSET ruleP12
		 CALL WriteString
		 MOV EDX, OFFSET ruleP13
		 CALL WriteString
		 MOV EDX, OFFSET ruleP14
		 CALL WriteString
		 MOV EDX, OFFSET ruleP15
		 CALL WriteString
		 MOV EDX, OFFSET ruleP16
		 CALL WriteString
		 MOV EDX, OFFSET ruleP17
		 CALL WriteString
		 MOV EDX, OFFSET ruleP18
		 CALL WriteString
		 MOV EDX, OFFSET ruleP19
		 CALL WriteString
		 MOV EDX, OFFSET ruleP20
		 CALL WriteString
		 MOV EDX, OFFSET ruleP21
		 CALL WriteString
		 MOV EDX, OFFSET ruleP22
		 CALL WriteString
;-----------------------------------畫面跳轉
		 .REPEAT
			CALL readkey
			.IF (al == 0Dh)||(al == ' ')
				call gameE
			.ELSEIF ah == 4Dh
				call rule2
			.ELSEIF ah == 4Bh
				call ruleB
			.ELSEIF (ah == 50h)||(ah == 48h)
				call rule3
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah == 4Bh)||(ah == 4Dh)||(al == ' ')||(ah == 50h)||(ah == 48h)
rule ENDP
;----------------------------------------------------------------------------------遊戲畫面(rule2)
rule2 PROC
		 call Clrscr
		 MOV EDX, OFFSET ruleP01
		 CALL WriteString
		 MOV EDX, OFFSET ruleP02
		 CALL WriteString
		 MOV EDX, OFFSET ruleP03
		 CALL WriteString
		 MOV EDX, OFFSET ruleP04
		 CALL WriteString
		 MOV EDX, OFFSET ruleP05
		 CALL WriteString
		 MOV EDX, OFFSET ruleP06
		 CALL WriteString
		 MOV EDX, OFFSET ruleP07
		 CALL WriteString
		 MOV EDX, OFFSET ruleP08
		 CALL WriteString
		 MOV EDX, OFFSET ruleP09
		 CALL WriteString
		 MOV EDX, OFFSET ruleP10
		 CALL WriteString
		 MOV EDX, OFFSET ruleP11
		 CALL WriteString
		 MOV EDX, OFFSET ruleP12
		 CALL WriteString
		 MOV EDX, OFFSET ruleP13
		 CALL WriteString
		 MOV EDX, OFFSET ruleP14
		 CALL WriteString
		 MOV EDX, OFFSET ruleP15
		 CALL WriteString
		 MOV EDX, OFFSET ruleP16
		 CALL WriteString
		 MOV EDX, OFFSET ruleP17
		 CALL WriteString
		 MOV EDX, OFFSET ruleP18
		 CALL WriteString
		 MOV EDX, OFFSET ruleP19
		 CALL WriteString
		 MOV EDX, OFFSET ruleP24
		 CALL WriteString
		 MOV EDX, OFFSET ruleP21
		 CALL WriteString
		 MOV EDX, OFFSET ruleP22
		 CALL WriteString
;-----------------------------------畫面跳轉
		 .REPEAT
			CALL readkey
			.IF (al == 0Dh)||(al == ' ')
				call gameN
			.ELSEIF ah == 4Bh
				call rule
			.ELSEIF ah == 4Dh
				call ruleB
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah == 4Bh)||(ah == 4Dh)||(al == ' ')
rule2 ENDP
;----------------------------------------------------------------------------------遊戲畫面(rule3)
rule3 PROC
		 call Clrscr
		 MOV EDX, OFFSET ruleP01
		 CALL WriteString
		 MOV EDX, OFFSET ruleP02
		 CALL WriteString
		 MOV EDX, OFFSET ruleP03
		 CALL WriteString
		 MOV EDX, OFFSET ruleP04
		 CALL WriteString
		 MOV EDX, OFFSET ruleP05
		 CALL WriteString
		 MOV EDX, OFFSET ruleP06
		 CALL WriteString
		 MOV EDX, OFFSET ruleP07
		 CALL WriteString
		 MOV EDX, OFFSET ruleP08
		 CALL WriteString
		 MOV EDX, OFFSET ruleP09
		 CALL WriteString
		 MOV EDX, OFFSET ruleP10
		 CALL WriteString
		 MOV EDX, OFFSET ruleP11
		 CALL WriteString
		 MOV EDX, OFFSET ruleP12
		 CALL WriteString
		 MOV EDX, OFFSET ruleP13
		 CALL WriteString
		 MOV EDX, OFFSET ruleP14
		 CALL WriteString
		 MOV EDX, OFFSET ruleP15
		 CALL WriteString
		 MOV EDX, OFFSET ruleP16
		 CALL WriteString
		 MOV EDX, OFFSET ruleP17
		 CALL WriteString
		 MOV EDX, OFFSET ruleP18
		 CALL WriteString
		 MOV EDX, OFFSET ruleP19
		 CALL WriteString
		 MOV EDX, OFFSET ruleP25
		 CALL WriteString
		 MOV EDX, OFFSET ruleP21
		 CALL WriteString
		 MOV EDX, OFFSET ruleP22
		 CALL WriteString
;-----------------------------------畫面跳轉
		 .REPEAT
			CALL readkey
			.IF (al == 0Dh)||(al == ' ')
				call gameh
			.ELSEIF ah == 4Bh
				call ruleB
			.ELSEIF ah == 4Dh
				call rule2
			.ELSEIF (ah == 50h)||(ah == 48h)
				call rule
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah == 4Bh)||(ah == 4Dh)||(al == ' ')||(ah == 50h)
rule3 ENDP
;----------------------------------------------------------------------------------遊戲畫面(ruleb)
ruleB PROC
		 call Clrscr
		 MOV EDX, OFFSET ruleP01
		 CALL WriteString
		 MOV EDX, OFFSET ruleP02
		 CALL WriteString
		 MOV EDX, OFFSET ruleP03
		 CALL WriteString
		 MOV EDX, OFFSET ruleP04
		 CALL WriteString
		 MOV EDX, OFFSET ruleP05
		 CALL WriteString
		 MOV EDX, OFFSET ruleP06
		 CALL WriteString
		 MOV EDX, OFFSET ruleP07
		 CALL WriteString
		 MOV EDX, OFFSET ruleP08
		 CALL WriteString
		 MOV EDX, OFFSET ruleP09
		 CALL WriteString
		 MOV EDX, OFFSET ruleP10
		 CALL WriteString
		 MOV EDX, OFFSET ruleP11
		 CALL WriteString
		 MOV EDX, OFFSET ruleP12
		 CALL WriteString
		 MOV EDX, OFFSET ruleP13
		 CALL WriteString
		 MOV EDX, OFFSET ruleP14
		 CALL WriteString
		 MOV EDX, OFFSET ruleP15
		 CALL WriteString
		 MOV EDX, OFFSET ruleP16
		 CALL WriteString
		 MOV EDX, OFFSET ruleP17
		 CALL WriteString
		 MOV EDX, OFFSET ruleP18
		 CALL WriteString
		 MOV EDX, OFFSET ruleP19
		 CALL WriteString
		 MOV EDX, OFFSET ruleP23
		 CALL WriteString
		 MOV EDX, OFFSET ruleP21
		 CALL WriteString
		 MOV EDX, OFFSET ruleP22
		 CALL WriteString
;-----------------------------------畫面跳轉
		 .REPEAT
			CALL readkey
			.IF (al == 0Dh)||(al == ' ')
				call menu1
			.ELSEIF ah == 4Dh
				call rule
			.ELSEIF ah == 4Bh
				call rule2
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah == 4Bh)||(ah == 4Dh)||(al == ' ')
ruleB ENDP
;----------------------------------------------------------------------------------遊戲畫面(colorset-yellow)
colorset PROC
		 call Clrscr
		 MOV EDX, OFFSET colorsetP01
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP02
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP03
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP04
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP05
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP06
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP07
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP08
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP09
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP10
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP11
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP12
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP13
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP14
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP15
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP16
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP17
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP18
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP19
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP20
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP21
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				MOV EAX,yellow 
				call setTextColor
				call colorset
			.ELSEIF ah == 50h	;下
				call colorsetW
			.ELSEIF ah == 48h	;上
				call colorsetB
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')

colorset ENDP
;----------------------------------------------------------------------------------遊戲畫面(colorset-while)
colorsetW PROC
		 call Clrscr
		 MOV EDX, OFFSET colorsetP01
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP02
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP03
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP04
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP05
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP06
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP07
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP08
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP09
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP10
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP11
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP12
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP24
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP14
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP23
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP16
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP17
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP18
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP19
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP20
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP21
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				MOV EAX,lightblue
				call setTextColor
				call colorsetW
			.ELSEIF ah == 50h	;下
				call colorsetB
			.ELSEIF ah == 48h	;上
				call colorset
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')

colorsetW ENDP
;----------------------------------------------------------------------------------遊戲畫面(colorset-back)
colorsetB PROC

		 call Clrscr
		 MOV EDX, OFFSET colorsetP01
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP02
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP03
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP04
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP05
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP06
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP07
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP08
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP09
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP10
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP11
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP12
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP24
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP14
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP15
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP16
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP25
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP18
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP19
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP20
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP21
		 CALL WriteString
		 MOV EDX, OFFSET colorsetP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call menu1
			.ELSEIF ah == 50h	;下
				call colorset
			.ELSEIF ah == 48h	;上
				call colorsetW
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')
colorsetB ENDP
;----------------------------------------------------------------------------------遊戲畫面(win1)
win PROC
		 call Clrscr
		 MOV EDX, OFFSET winP01
		 CALL WriteString
		 MOV EDX, OFFSET winP02
		 CALL WriteString
		 MOV EDX, OFFSET winP03
		 CALL WriteString
		 MOV EDX, OFFSET winP04
		 CALL WriteString
		 MOV EDX, OFFSET winP05
		 CALL WriteString
		 MOV EDX, OFFSET winP06
		 CALL WriteString
		 MOV EDX, OFFSET winP07
		 CALL WriteString
		 MOV EDX, OFFSET winP08
		 CALL WriteString
		 MOV EDX, OFFSET winP09
		 CALL WriteString
		 MOV EDX, OFFSET winP10
		 CALL WriteString
		 MOV EDX, OFFSET winP11
		 CALL WriteString
		 MOV EDX, OFFSET winP12
		 CALL WriteString
		;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET winP14
		 CALL WriteString
		 MOV EDX, OFFSET winP15
		 CALL WriteString
		 MOV EDX, OFFSET winP16
		 CALL WriteString
		 MOV EDX, OFFSET winP17
		 CALL WriteString
		 MOV EDX, OFFSET winP18
		 CALL WriteString
		 MOV EDX, OFFSET winP19
		 CALL WriteString
		 MOV EDX, OFFSET winP20
		 CALL WriteString
		 MOV EDX, OFFSET winP21
		 CALL WriteString
		 MOV EDX, OFFSET winP22
		 CALL WriteString

;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call rule
			.ELSEIF ah == 50h	;下
				call win2
			.ELSEIF ah == 48h	;上
				call win3
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')
win ENDP

;----------------------------------------------------------------------------------遊戲畫面(win2)
win2 PROC
		 call Clrscr
		 MOV EDX, OFFSET winP01
		 CALL WriteString
		 MOV EDX, OFFSET winP02
		 CALL WriteString
		 MOV EDX, OFFSET winP03
		 CALL WriteString
		 MOV EDX, OFFSET winP04
		 CALL WriteString
		 MOV EDX, OFFSET winP05
		 CALL WriteString
		 MOV EDX, OFFSET winP06
		 CALL WriteString
		 MOV EDX, OFFSET winP07
		 CALL WriteString
		 MOV EDX, OFFSET winP08
		 CALL WriteString
		 MOV EDX, OFFSET winP09
		 CALL WriteString
		 MOV EDX, OFFSET winP10
		 CALL WriteString
		 MOV EDX, OFFSET winP11
		 CALL WriteString
		 MOV EDX, OFFSET winP12
		 CALL WriteString
		;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET winP14
		 CALL WriteString
		 MOV EDX, OFFSET winP15
		 CALL WriteString
		 MOV EDX, OFFSET winP23
		 CALL WriteString
		 MOV EDX, OFFSET winP17
		 CALL WriteString
		 MOV EDX, OFFSET winP24
		 CALL WriteString
		 MOV EDX, OFFSET winP19
		 CALL WriteString
		 MOV EDX, OFFSET winP20
		 CALL WriteString
		 MOV EDX, OFFSET winP21
		 CALL WriteString
		 MOV EDX, OFFSET winP22
		 CALL WriteString
;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER空白
				call menu1
			.ELSEIF ah == 50h	;下
				call win3
			.ELSEIF ah == 48h	;上
				call win
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')
win2 ENDP
;----------------------------------------------------------------------------------遊戲畫面(win3)
win3 PROC
		 call Clrscr
		 MOV EDX, OFFSET winP01
		 CALL WriteString
		 MOV EDX, OFFSET winP02
		 CALL WriteString
		 MOV EDX, OFFSET winP03
		 CALL WriteString
		 MOV EDX, OFFSET winP04
		 CALL WriteString
		 MOV EDX, OFFSET winP05
		 CALL WriteString
		 MOV EDX, OFFSET winP06
		 CALL WriteString
		 MOV EDX, OFFSET winP07
		 CALL WriteString
		 MOV EDX, OFFSET winP08
		 CALL WriteString
		 MOV EDX, OFFSET winP09
		 CALL WriteString
		 MOV EDX, OFFSET winP10
		 CALL WriteString
		 MOV EDX, OFFSET winP11
		 CALL WriteString
		 MOV EDX, OFFSET winP12
		 CALL WriteString
		;-----------------------------------輸出分數
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET winP14
		 CALL WriteString
		 MOV EDX, OFFSET winP15
		 CALL WriteString
		 MOV EDX, OFFSET winP23
		 CALL WriteString
		 MOV EDX, OFFSET winP17
		 CALL WriteString
		 MOV EDX, OFFSET winP18
		 CALL WriteString
		 MOV EDX, OFFSET winP19
		 CALL WriteString
		 MOV EDX, OFFSET winP25
		 CALL WriteString
		 MOV EDX, OFFSET winP21
		 CALL WriteString
		 MOV EDX, OFFSET winP22
		 CALL WriteString

;-----------------------------------畫面跳轉	 
		 .REPEAT
			CALL Readkey
			.IF (al == 0Dh)||(al == ' ') ;ENTER或空白
				invoke ExitProcess,0
			.ELSEIF ah == 50h	;下
				call win
			.ELSEIF ah == 48h	;上
				call win2
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)||(al == ' ')
win3 ENDP

END main
