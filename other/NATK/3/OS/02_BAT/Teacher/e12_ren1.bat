@echo off 			
if  -%1 == -  goto no_param1	
if not exist %1 goto not_exist1
if  -%2 == -  goto no_param2	
if not exist %1\%2 goto not_exist2
if  -%3 == -  goto no_param3
if exist %1\%3 goto yes_exist
echo === ��२��������� 䠩�� %2 � ��⠫��� %1 �� %3 ===	
ren %1\%2 %3
goto exit			
: no_param1			
echo ������ ���� ����� ��⠫��
goto exit			
: no_param2			
echo ������ ���� ����� 䠩� � ��⠫��� %1
goto exit			
: no_param3			
echo ������� ���� ������ ����� ��� ��� ��२��������� 䠩�� %2
goto exit			
: not_exist1		
echo ��⠫�� %1 �� ������		
goto exit			
: not_exist2		
echo ���� � ������ %2 �� �������
goto exit			
: yes_exist		
echo ���� � ���� ������ %3 㦥 ������� � ��⠫��� %1
: exit				
