@echo off 			
rem shift			
if  -%1 == -  goto no_param1	
if  -%2 == -  goto no_param2	
if not exist %2 goto not_exist2
if not exist %2\%1 goto not_exist1
echo === �������� 䠩�� %1 �� ��⠫��� %2 ===	
del %2\%1
goto exit			
: no_param1			
echo ������ ���� ����� 䠩� ��� 㤠����� 
goto exit			
: no_param2			
echo ������ ���� ����� ��⠫��, ��㤠 㤠����� 䠩� %1
goto exit			
: not_exist1			
echo ���� %1 � ��⠫��� %2 �� ������		
goto exit			
: not_exist2			
echo ��⠫�� %2 �� ������		
: exit				
