Program lab_14;
{$APPTYPE CONSOLE}

uses SysUtils;
{ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

Type {���:}
     matrix = array [1..10,1..10] of integer; {������������� �������}
     mix = array [1..10,1..10] of Longint; {��������� ������������}
     mx = array [0..7] of byte; {����������� ������}
     ms = array [1..10,1..10] of byte; {����������� ����������� ������}
     arr_matr = array [1..7] of matrix; {������ ������}
     str1 = array [1..7] of string[50]; {������ ����������� ������}
Var
    U: arr_matr; {������ ������}
    p: mx;{����������� ������}
    m: matrix;
    A: mix;
    R: str1;{������ ����������� ������}
    s: ms;{����������� ����������� ������}
    n,k,i,l,j: byte;
    H: string[8];

{---------- ��������� ������������ ������ ---------}
Procedure MATRIX_MULTIPLY(var C: mix; A,B: mix; cA,cB,rA,rB: byte);
Var i,j,k: byte;
Begin
  {���� ����� �������� ������ ������� �� ����� ����� ����� ������ �������}
  If cA <> rB Then writeln('The error of multiply!!!')
    else
       For i:= 1 To rA Do
         For j:= 1 To cB Do
           Begin
              C[i,j]:= 0;
              For k:= 1 To cA Do
                   C[i,j]:= C[i,j] + A[i,k]*B[k,j];
           end;
end;

{-- ��������� ���������� ����������� ��������� ����������� ������ --}
{---- � ��������� ������� ����������� ������ � ������������ ������ -----}
Procedure MATRIX_CHAIN_ORDER(var m:matrix; var s:ms; P:mx; n:byte);
Var i,j,l,k: byte;
    q: longint;
Begin
   For i:=1 To n Do m[i, i]:= 0;{��������� ������� �� ���� ����}

   For l:=2 To n Do {���������� ������}
       For i:=1 To n-l+1 Do
         Begin
           j:= i + l - 1; {������� ������ �������������}
           m[i,j]:= maxint; {����������� ����������� ��������� ��������}
           For k:=i To j-1 Do
             Begin
               {��������� ��������� ������������ ������}
               q:= m[i,k] + m[k+1,j] + p[i-1]*p[k]*p[j];
               If q < m[i,j] Then{������� ����������� ���������}
                                Begin
                                  m[i,j]:= q;
                                  s[i,j]:= k;{������������ ������}
                                end;
             end;
         end;
end;

{-- ��������� ���������� ���������� ������������ ������ --}
{-- � ����������� ������ � ����������� ������ --}
Procedure MATRIX_CHAIN_MULTIPLY(var A:mix; var R:str1; U:arr_matr; s:ms; i,j:byte);
Var k,l: byte;
    v,v1: string;
    x,y,C: mix;

Begin
   If j > i Then{������� �� ���������� ���� �� ����}
     Begin
        MATRIX_CHAIN_MULTIPLY(A, R, U, S, I, S[I,J]);
        X:= A;
        MATRIX_CHAIN_MULTIPLY(A, R, U, s, s[I,J]+1, j);
        Y:= A;
        MATRIX_MULTIPLY(C,X,Y,p[s[i,j]],p[j],p[i-1],p[s[i,j]]);
        {������������ ������}

        {-------- ����������� ������ --------------}
        If (R[s[i,j]]<>'') And (R[j]<>'') Then
        {��� ������� ���������� �� � ������ ���}
             Begin
               R[s[i,j]]:= R[s[i,j]] + R[j];
               R[j]:= R[s[i,j]];
             end
        else
         If (R[s[i,j]]='') And (R[j]<>'') Then
             Begin
               str(s[i,j],v);
               R[j]:= '(' + v + R[j] + ')';
               R[s[i,j]]:= R[j];
             end
         else
          If (R[j]='') And (R[s[i,j]]<>'') Then
          {���� �� ������ ������� � ������ ���}
             Begin
               str(j,v);
               R[s[i,j]]:= '(' + R[s[i,j]] + v + ')';
               R[j]:= R[s[i,j]];
             end
           else{������� ������������� � ������ ���}
             Begin
               str(s[i,j],v);
               str(j,v1);
               R[s[i,j]]:= '(' + v + ' ' + v1 + ')';
               R[j]:= '(' + v + ' ' + v1 + ')';
             end;
     end
   else{������� ���� �� �������������� ������}
     Begin
      For k:=1 To p[i-1] Do
       For l:=1 To p[j] Do
         C[k,l]:= U[i][k,l];
     end;
   A:= C;{��������� ������������}
end;

{-------- ��� �������� ��������� -----------}
Begin
  Repeat{��������}
   write('>> Specify the number of matrices (2..7): ');
   readln(n);{������� ����� ������}
  Until (n>1) And (n<=7);
  For i:=1 To n Do{������� ����������� ������}
    Repeat
     If i=1 Then{������� ����������� ������ ������}
        Begin
          Repeat{��������}
           write('Specify size of ',i,' matrix: ');
           read(p[i-1]);
           readln(p[i]);
          Until (p[i-1]>1) And (p[i-1]<=10);
        end
     else
        Begin
           write('Specify size of ',i,' matrix: ',p[i-1],' ');
           readln(p[i]);
        end;
    Until (p[i]>1) And (p[i]<=10);
  randomize;
  {���������� ������ ���������������� �������  � ����� ������ �� �����}
  writeln;
  For l:=1 To n Do
   Begin
    writeln(l,'# matrix :');
    For i:=1 To p[l-1] Do
     Begin
      For j:=1 To p[l] Do
       Begin
         U[l][i,j]:= random(10);
         write(U[l][i,j],' ');
       end;
      writeln;
     end;
    writeln;
   end;
  MATRIX_CHAIN_ORDER(m,s,P,n);{��������� � ���������}
  Writeln('The lowest cost multiplier: ',m[1,n]);
  MATRIX_CHAIN_MULTIPLY(A,R,U,s,1,n);{��������� � ���������}
  writeln;
  writeln('Arrangement of parentheses: ',R[s[1,n]]);
  writeln;
  writeln('The result obtained: ');
  writeln;
  For i:=1 To p[0] Do{����� ���������� ������������ ������ �� �����}
   Begin
    For j:=1 To p[n] Do
     Begin
       If (A[i,j]>=0) And (A[i,j]<=9) Then H:='        '
       {��� �������� ��������� �������}
        else If (A[i,j]>=10) And (A[i,j]<=99) Then H:='       '
         else If (A[i,j]>=100) And (A[i,j]<=999) Then H:='      '
          else If (A[i,j]>=1000) And (A[i,j]<=9999) Then H:='     '
            else If (A[i,j]>=10000) And (A[i,j]<=99999) Then H:='    '
             else If (A[i,j]>=100000) And (A[i,j]<=999999) Then H:='   '
              else If (A[i,j]>=1000000) And (A[i,j]<=9999999) Then H:='  '
               else H:=' ';
       write(A[i,j],H);
     end;
    writeln;
   end;
  ReadLn;
End.
