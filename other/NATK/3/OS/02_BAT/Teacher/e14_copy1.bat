@echo off 			
rem shift			
if  -%1 == -  goto no_param1	
if  -%2 == -  goto no_param2	
if  -%3 == -  goto no_param3	
if not exist %1 goto not_exist1
if not exist %2 goto not_exist2
if not exist %1\%3 goto not_exist3
if exist %2\%3 goto yes_exist3
echo === ����஢���� 䠩�� %3 �� ��⠫��� %1 � ��⠫�� %2 ===	
copy %1\%3 %2\
goto exit			
: no_param1			
echo ������ ���� ����� ��⠫��, ��㤠 ��������� 䠩� 
goto exit			
: no_param2			
echo ������ ���� ����� ��⠫��, �㤠 ��������� 䠩� 
goto exit			
: no_param3			
echo ������ ���� ����� �����㥬� 䠩� �� ��⠫��� %1
goto exit			
: not_exist1			
echo ��⠫�� %1 �� ������		
goto exit			
: not_exist2			
echo ��⠫�� %2 �� ������		
goto exit			
: not_exist3			
echo ���� %3 � ��⠫��� %1 �� ������		
goto exit			
: yes_exist3
echo ���� %3 � ��⠫��� %2 㦥 �������		
: exit				
