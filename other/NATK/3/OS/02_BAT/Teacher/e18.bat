@echo off 			
if  -%1 == -  goto no_param1	
if  -%2 == -  goto no_param2	
if exist %2 goto exist
echo === �������� �����⠫��� %1 � ⥪�饬 ��⠫��� ===
md %1
echo === ������� 䠩� %2 � �����⠫��� %1 ===
copy con %1\%2
echo === ����஢���� ᮧ������� 䠩�� %2 �� �����⠫��� %1 � ⥪�騩 ��⠫�� ===	
copy %1\%2
pause
echo === �������� ᮧ������� �����⠫��� %1 ===	
rd %1 /S /Q
pause
echo === �������� ᪮��஢������ 䠩�� %2 �� ⥪�饣� ��⠫��� ===	
del %2 
goto exit			
: no_param1			
echo ������ ���� ����� �����⠫��
goto exit			
: no_param2			
echo ������ ���� ������ ��� ᮧ��������� 䠩�� � �����⠫��� %1
goto exit			
: exist		
echo ���� %2 � ⥪�饬 ��⠫��� �� ������ ����⢮����
: exit				
