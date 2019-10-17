Program   sudoku;
Uses      crt;
Var       Satir,Sutun,I,J,K,L,m,n,oyunbitti,NO:integer;
          Ch,SPC:char;
          S: array [1..4,1..6,1..6] of char;
Procedure Su(I,J:integer);
Begin
   Write (S[1,I,J]);
   If S[4,I,J]='1' then TextColor(Red);
   Write (S[2,I,J]);
   TextColor(White);
   Write (S[3,I,J]);
End;

Begin
   S[1,1,1]:='>'; S[1,1,2]:=' '; SPC:=' '; TextColor(White);
   Repeat
    Clrscr;
    Writeln ('     SUDOKU');
    Writeln ();
    Writeln ('  ',S[1,1,1],' Turkce');
    Writeln ('  ',S[1,1,2],' English');
    Ch:=Readkey;
    If Ch=#72 then                Begin S[1,1,1]:='>'; S[1,1,2]:=' '; End
              else If Ch=#80 then Begin S[1,1,1]:=' '; S[1,1,2]:='>'; End;
   Until Ch=#13;

   If S[1,1,1]='>'
     {TURKCE}
    then
    Begin

     S[1,1,1]:='>'; S[1,1,2]:=' '; S[1,1,3]:=' '; I:=1;
    Repeat
     Repeat

      Clrscr;
      Writeln ('     SUDOKU - Turkce');
      Writeln ();
      Writeln ('  ',S[1,1,1],' Nasil Oynanir');
      Writeln ('  ',S[1,1,2],' Oyuna Basla');
      Writeln ('  ',S[1,1,3],' Hakkimda');

      Repeat
       Ch:=ReadKey;
      Until (((Ch=#72) Or (Ch=#80)) OR (Ch=#13));
           If ((Ch=#72)AND(I>1)) then Begin S[1,1,I]:=' '; I:=I-1; S[1,1,I]:='>'; End
      else If ((Ch=#80)AND(I<3)) then Begin S[1,1,I]:=' '; I:=I+1; S[1,1,I]:='>'; End

     Until Ch=#13;

     If I=1 then
     Begin;
         {Nasýl Oynanýr?}
      Clrscr;
      Writeln ('     Nasil Oynanir?');
      Writeln ();
      Writeln (' > Her satirda 1den 6ya kadar tum sayilar olmalidir.');
      Writeln (' > Her sutunda 1den 6ya kadar tum sayilar olmalidir.');
      Writeln (' > Her 2 satir ve 3 sutunluk dikdortgen bolgelerde 1den 6ya kadar tum sayilar olmalidir.');
      Writeln (' > Size verilen kirmizi renkli sayilara gore geri kalan bosluklari doldurunuz.');
      Writeln (' > Yon tuslarini ve 0, 1, 2, 3, 4, 5, 6 sayilarinini kullanarak sudokuyu cozunuz.');
      Writeln ();
      Writeln ('  Ana menuye donmek icin ENTER tusuna basiniz.');
      Readln  ();

     End

     else If I=3 then
     Begin
         {Hakkýmda}
      Clrscr;
      Writeln ('     Hakkimda');
      Writeln ();
      Writeln ('Bu SUDOKU oyunu Ahmed Bilal GUVENC tarafindan kodlanmistir.');
      Writeln ('Tum haklari saklidir. Kodlar izinsiz olarak degistirilemez veya kullanilamaz.');
      Writeln ('Copyright 2016.  E-mail: bilalguvenc98@gmail.com');
      Writeln ();
      Writeln ('  Ana menuye donmek icin ENTER tusuna basiniz.');
      Readln  ();
     End;

    Until I=2;

       {Sudoku haritasýný sýfýrla}
     For I:=1 to 6 do For J:=1 to 6 do Begin 
                                          S[1,I,J]:=' ';
                                          S[2,I,J]:=' ';
                                          S[3,I,J]:=' ';
                                          S[4,I,J]:='0';
                                       End;
       {Ýmleci sol üstten baþlat}
     S[1,1,1]:='>'; S[3,1,1]:='<'; Satir:=1; Sutun:=1; 


     NO:=1; {Sudoku haritasý NO:1}
     S[2,1,2]:='4'; S[4,1,2]:='1'; 
     S[2,1,6]:='5'; S[4,1,6]:='1'; 
     S[2,2,3]:='6'; S[4,2,3]:='1'; 
     S[2,2,6]:='1'; S[4,2,6]:='1'; 
     S[2,3,1]:='1'; S[4,3,1]:='1'; 
     S[2,3,3]:='3'; S[4,3,3]:='1'; 
     S[2,4,4]:='3'; S[4,4,4]:='1'; 
     S[2,4,6]:='2'; S[4,4,6]:='1'; 
     S[2,5,1]:='3'; S[4,5,1]:='1'; 
     S[2,5,4]:='1'; S[4,5,4]:='1'; 
     S[2,6,1]:='6'; S[4,6,1]:='1'; 
     S[2,6,5]:='2'; S[4,6,5]:='1';

      
       
     Repeat
        {Sudoku tablosunu ekrana yansýtma}
      Clrscr;
      Writeln ('     SUDOKU Harita: ',NO);
      Writeln ();
      Writeln ('   -------------------');
      Write   ('  |'); Su(1,1); Su(1,2); Su(1,3); Write ('|'); Su(1,4); Su(1,5); Su(1,6); Writeln ('|');
      Write   ('  |'); Su(2,1); Su(2,2); Su(2,3); Write ('|'); Su(2,4); Su(2,5); Su(2,6); Writeln ('|');
      Writeln ('  |-------------------|');
      Write   ('  |'); Su(3,1); Su(3,2); Su(3,3); Write ('|'); Su(3,4); Su(3,5); Su(3,6); Writeln ('|');
      Write   ('  |'); Su(4,1); Su(4,2); Su(4,3); Write ('|'); Su(4,4); Su(4,5); Su(4,6); Writeln ('|');
      Writeln ('  |-------------------|');
      Write   ('  |'); Su(5,1); Su(5,2); Su(5,3); Write ('|'); Su(5,4); Su(5,5); Su(5,6); Writeln ('|');
      Write   ('  |'); Su(6,1); Su(6,2); Su(6,3); Write ('|'); Su(6,4); Su(6,5); Su(6,6); Writeln ('|');
      Writeln ('   -------------------');
      Writeln ();
      Writeln ('YON TUSLARI ve 1-6 SAYILAR');
      Writeln ('0 tusu ile secili yeri sil.');


        {Klavyeden tuþ okuma}
      Repeat
        Ch:=readkey;  {#72=ÜST #75=SOL #80=ALT #77=SAÐ}
      Until ((((((CH='1')OR(CH='2')) OR ((CH='3')OR(CH='4'))) OR (((CH='5')OR(CH='6')) OR ((CH=#72)OR(CH=#75)))) OR (CH=#77)OR(CH=#80))OR(CH=#48));

      If ( (S[4, Satir , Sutun ]='0') AND ((((CH='1')OR(CH='2')) OR ((CH='3')OR(CH='4'))) OR ((CH='5')OR(CH='6'))) ) then S[2,Satir,Sutun]:=CH
          else If ((CH=#48)AND(S[4,Satir,Sutun]='0')) then S[2,Satir,Sutun]:=' '
          else If ((CH=#72)AND(Satir>1)) then  BEGIN S[1,Satir,Sutun]:=' '; S[3,Satir,Sutun]:=' '; Satir:=Satir-1; S[1,Satir,Sutun]:='>'; S[3,Satir,Sutun]:='<'; END   {ÜSTE DOÐRU: I. satýrdan I-1. satýra}
          else If ((CH=#80)AND(Satir<6)) then  BEGIN S[1,Satir,Sutun]:=' '; S[3,Satir,Sutun]:=' '; Satir:=Satir+1; S[1,Satir,Sutun]:='>'; S[3,Satir,Sutun]:='<'; END   {ALTA DOÐRU: I. satýrdan I+1. satýra}
          else If ((CH=#75)AND(Sutun>1)) then  BEGIN S[1,Satir,Sutun]:=' '; S[3,Satir,Sutun]:=' '; Sutun:=Sutun-1; S[1,Satir,Sutun]:='>'; S[3,Satir,Sutun]:='<'; END   {SOLA DOÐRU: I. sütundan I-1. sütuna}
          else If ((Ch=#77)AND(Sutun<6)) then  BEGIN S[1,Satir,Sutun]:=' '; S[3,Satir,Sutun]:=' '; Sutun:=Sutun+1; S[1,Satir,Sutun]:='>'; S[3,Satir,Sutun]:='<'; END;  {SAÐA DOÐRU: I. sütundan I+1. sütuna}


        {Oyunun bitip bitmediðini kontrol etme}
      oyunbitti:=1;
      For I:=1 to 6 do For J:=1 to 6 do If S[2,I,J]=SPC then oyunbitti:=0; {Eðer haritada boþluk varsa oyun bitmez.}

      If oyunbitti=1 then
         Begin
             
            For K:=1 to 6 do For I:=1 to 6 do For J:=1 to 6 do
               Begin
                  If K<>I then Begin
                                  If S[2,K,J]=S[2,I,J] then oyunbitti:=0; {Sütun kontrol: Sütundaki tüm elemanlar farklý}
                                  If S[2,J,K]=S[2,J,I] then oyunbitti:=0; {Satýr kontrol: Satýrdaki tüm elemanlar farklý}
                               End;
               End;
                     
                        
            For I:=1 to 2 do For J:=1 to 3 do For K:=1 to 2 do For L:=1 to 3 do For m:=0 to 2 do For n:=0 to 1 do
                  If ((I=K)AND(J=L)) then else If (S[2,I+2*m,J+3*n]=S[2,K+2*m,L+3*n]) then oyunbitti:=0; {Kutu kontrol: Kutudaki tüm elemanlar farklý}
                      
         End;

     Until oyunbitti=1;




      Clrscr;
      Writeln ('     SUDOKU Harita: ',NO);
      Writeln ();
      Writeln ('   -------------------');
      Write   ('  |'); Su(1,1); Su(1,2); Su(1,3); Write ('|'); Su(1,4); Su(1,5); Su(1,6); Writeln ('|');
      Write   ('  |'); Su(2,1); Su(2,2); Su(2,3); Write ('|'); Su(2,4); Su(2,5); Su(2,6); Writeln ('|');
      Writeln ('  |-------------------|');
      Write   ('  |'); Su(3,1); Su(3,2); Su(3,3); Write ('|'); Su(3,4); Su(3,5); Su(3,6); Writeln ('|');
      Write   ('  |'); Su(4,1); Su(4,2); Su(4,3); Write ('|'); Su(4,4); Su(4,5); Su(4,6); Writeln ('|');
      Writeln ('  |-------------------|');
      Write   ('  |'); Su(5,1); Su(5,2); Su(5,3); Write ('|'); Su(5,4); Su(5,5); Su(5,6); Writeln ('|');
      Write   ('  |'); Su(6,1); Su(6,2); Su(6,3); Write ('|'); Su(6,4); Su(6,5); Su(6,6); Writeln ('|');
      Writeln ('   -------------------');
      Writeln ();
      Writeln ('  Tebrikler! Oyun bitti.');
      Writeln ('Oyunu kapatmak icin ENTER tusuna basiniz.');
      Readln  ();
    End














     {ENGLISH}
    else 
    Begin

     S[1,1,1]:='>'; S[1,1,2]:=' '; S[1,1,3]:=' '; I:=1;
    Repeat
     Repeat

      Clrscr;
      Writeln ('     SUDOKU - English');
      Writeln ();
      Writeln ('  ',S[1,1,1],' How To Play');
      Writeln ('  ',S[1,1,2],' Start Game');
      Writeln ('  ',S[1,1,3],' About Me');

      Repeat
       Ch:=ReadKey;
      Until (((Ch=#72) Or (Ch=#80)) OR (Ch=#13));
           If ((Ch=#72)AND(I>1)) then Begin S[1,1,I]:=' '; I:=I-1; S[1,1,I]:='>'; End
      else If ((Ch=#80)AND(I<3)) then Begin S[1,1,I]:=' '; I:=I+1; S[1,1,I]:='>'; End

     Until Ch=#13;

     If I=1 then
     Begin;
         {Nasýl Oynanýr?}
      Clrscr;
      Writeln ('     How To Play?');
      Writeln ();
      Writeln (' > Every line must contain numbers 1 to 6.');
      Writeln (' > Every column must contain numbers 1 to 6.');
      Writeln (' > Every 2 line x 3 column boxes must contain numbers 1 to 6.');
      Writeln (' > You should fill the blanks regarding to given numbers. (Red ones)');
      Writeln (' > Use arrow keys and numbers 0 to 6 to play.');
      Writeln ();
      Writeln ('  Press ENTER to return main page.');
      Readln  ();

     End

     else If I=3 then
     Begin
         {Hakkýmda}
      Clrscr;
      Writeln ('     About Me');
      Writeln ();
      Writeln ('This SUDOKU game coded by Ahmed Bilal GUVENC. Every rights are reserved.');
      Writeln ('It is forbidden to copy and change the codes.');
      Writeln ('Copyright 2016.  E-mail: bilalguvenc98@gmail.com');
      Writeln ();
      Writeln ('  Press ENTER to return main page.');
      Readln  ();
     End;

    Until I=2;

       {Sudoku haritasýný sýfýrla}
     For I:=1 to 6 do For J:=1 to 6 do Begin 
                                          S[1,I,J]:=' ';
                                          S[2,I,J]:=' ';
                                          S[3,I,J]:=' ';
                                          S[4,I,J]:='0';
                                       End;
       {Ýmleci sol üstten baþlat}
     S[1,1,1]:='>'; S[3,1,1]:='<'; Satir:=1; Sutun:=1; 


     NO:=1; {Sudoku haritasý NO:1}
     S[2,1,2]:='4'; S[4,1,2]:='1'; 
     S[2,1,6]:='5'; S[4,1,6]:='1'; 
     S[2,2,3]:='6'; S[4,2,3]:='1'; 
     S[2,2,6]:='1'; S[4,2,6]:='1'; 
     S[2,3,1]:='1'; S[4,3,1]:='1'; 
     S[2,3,3]:='3'; S[4,3,3]:='1'; 
     S[2,4,4]:='3'; S[4,4,4]:='1'; 
     S[2,4,6]:='2'; S[4,4,6]:='1'; 
     S[2,5,1]:='3'; S[4,5,1]:='1'; 
     S[2,5,4]:='1'; S[4,5,4]:='1'; 
     S[2,6,1]:='6'; S[4,6,1]:='1'; 
     S[2,6,5]:='2'; S[4,6,5]:='1';
      
      
       
     Repeat
        {Sudoku tablosunu ekrana yansýtma}
      Clrscr;
      Writeln ('     SUDOKU Map: ',NO);
      Writeln ();
      Writeln ('   -------------------');
      Write   ('  |'); Su(1,1); Su(1,2); Su(1,3); Write ('|'); Su(1,4); Su(1,5); Su(1,6); Writeln ('|');
      Write   ('  |'); Su(2,1); Su(2,2); Su(2,3); Write ('|'); Su(2,4); Su(2,5); Su(2,6); Writeln ('|');
      Writeln ('  |-------------------|');
      Write   ('  |'); Su(3,1); Su(3,2); Su(3,3); Write ('|'); Su(3,4); Su(3,5); Su(3,6); Writeln ('|');
      Write   ('  |'); Su(4,1); Su(4,2); Su(4,3); Write ('|'); Su(4,4); Su(4,5); Su(4,6); Writeln ('|');
      Writeln ('  |-------------------|');
      Write   ('  |'); Su(5,1); Su(5,2); Su(5,3); Write ('|'); Su(5,4); Su(5,5); Su(5,6); Writeln ('|');
      Write   ('  |'); Su(6,1); Su(6,2); Su(6,3); Write ('|'); Su(6,4); Su(6,5); Su(6,6); Writeln ('|');
      Writeln ('   -------------------');
      Writeln ();
      Writeln ('ARROW KEYS and NUMBERS 1 to 6');
      Writeln ('Use 0 to delete numbers.');


        {Klavyeden tuþ okuma}
      Repeat
        Ch:=readkey;  {#72=ÜST #75=SOL #80=ALT #77=SAÐ}
      Until ((((((CH='1')OR(CH='2')) OR ((CH='3')OR(CH='4'))) OR (((CH='5')OR(CH='6')) OR ((CH=#72)OR(CH=#75)))) OR (CH=#77)OR(CH=#80))OR(CH=#48));

      If ( (S[4, Satir , Sutun ]='0') AND ((((CH='1')OR(CH='2')) OR ((CH='3')OR(CH='4'))) OR ((CH='5')OR(CH='6'))) ) then S[2,Satir,Sutun]:=CH
          else If ((CH=#48)AND(S[4,Satir,Sutun]='0')) then S[2,Satir,Sutun]:=' '
          else If ((CH=#72)AND(Satir>1)) then  BEGIN S[1,Satir,Sutun]:=' '; S[3,Satir,Sutun]:=' '; Satir:=Satir-1; S[1,Satir,Sutun]:='>'; S[3,Satir,Sutun]:='<'; END   {ÜSTE DOÐRU: I. satýrdan I-1. satýra}
          else If ((CH=#80)AND(Satir<6)) then  BEGIN S[1,Satir,Sutun]:=' '; S[3,Satir,Sutun]:=' '; Satir:=Satir+1; S[1,Satir,Sutun]:='>'; S[3,Satir,Sutun]:='<'; END   {ALTA DOÐRU: I. satýrdan I+1. satýra}
          else If ((CH=#75)AND(Sutun>1)) then  BEGIN S[1,Satir,Sutun]:=' '; S[3,Satir,Sutun]:=' '; Sutun:=Sutun-1; S[1,Satir,Sutun]:='>'; S[3,Satir,Sutun]:='<'; END   {SOLA DOÐRU: I. sütundan I-1. sütuna}
          else If ((Ch=#77)AND(Sutun<6)) then  BEGIN S[1,Satir,Sutun]:=' '; S[3,Satir,Sutun]:=' '; Sutun:=Sutun+1; S[1,Satir,Sutun]:='>'; S[3,Satir,Sutun]:='<'; END;  {SAÐA DOÐRU: I. sütundan I+1. sütuna}


        {Oyunun bitip bitmediðini kontrol etme}
      oyunbitti:=1;
      For I:=1 to 6 do For J:=1 to 6 do If S[2,I,J]=SPC then oyunbitti:=0; {Eðer haritada boþluk varsa oyun bitmez.}

      If oyunbitti=1 then
         Begin
             
            For K:=1 to 6 do For I:=1 to 6 do For J:=1 to 6 do
               Begin
                  If K<>I then Begin
                                  If S[2,K,J]=S[2,I,J] then oyunbitti:=0; {Sütun kontrol: Sütundaki tüm elemanlar farklý}
                                  If S[2,J,K]=S[2,J,I] then oyunbitti:=0; {Satýr kontrol: Satýrdaki tüm elemanlar farklý}
                               End;
               End;
                     
                        
            For I:=1 to 2 do For J:=1 to 3 do For K:=1 to 2 do For L:=1 to 3 do For m:=0 to 2 do For n:=0 to 1 do
                  If ((I=K)AND(J=L)) then else If (S[2,I+2*m,J+3*n]=S[2,K+2*m,L+3*n]) then oyunbitti:=0; {Kutu kontrol: Kutudaki tüm elemanlar farklý}
                      
         End;

     Until oyunbitti=1;




      Clrscr;
      Writeln ('     SUDOKU Map: ',NO);
      Writeln ();
      Writeln ('   -------------------');
      Write   ('  |'); Su(1,1); Su(1,2); Su(1,3); Write ('|'); Su(1,4); Su(1,5); Su(1,6); Writeln ('|');
      Write   ('  |'); Su(2,1); Su(2,2); Su(2,3); Write ('|'); Su(2,4); Su(2,5); Su(2,6); Writeln ('|');
      Writeln ('  |-------------------|');
      Write   ('  |'); Su(3,1); Su(3,2); Su(3,3); Write ('|'); Su(3,4); Su(3,5); Su(3,6); Writeln ('|');
      Write   ('  |'); Su(4,1); Su(4,2); Su(4,3); Write ('|'); Su(4,4); Su(4,5); Su(4,6); Writeln ('|');
      Writeln ('  |-------------------|');
      Write   ('  |'); Su(5,1); Su(5,2); Su(5,3); Write ('|'); Su(5,4); Su(5,5); Su(5,6); Writeln ('|');
      Write   ('  |'); Su(6,1); Su(6,2); Su(6,3); Write ('|'); Su(6,4); Su(6,5); Su(6,6); Writeln ('|');
      Writeln ('   -------------------');
      Writeln ();
      Writeln ('Congratulations! Game over.');
      Writeln ('Press ENTER to close the game.');
      Readln  ();
    End;

End.
