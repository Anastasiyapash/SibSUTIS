@echo off 			
rem shift			
if  -%1 == -  goto no_param1	
if  -%2 == -  goto no_param2	
if not exist %1 goto not_exist1
if exist %2 goto yes_exist2
echo === ����஢���� ��⠫��� %1 � ��⠫�� %2 ===	
xcopy %1 %2 /E
goto exit			
: no_param1			
echo ������ ���� ����� �����㥬� ��⠫��
goto exit			
: no_param2			
echo ������ ���� ����� ��⠫��, �㤠 �믮����� ����஢����
goto exit			
: not_exist1			
echo ��⠫�� %1 �� ������		
goto exit			
: yes_exist2			
echo ��⠫�� %2 㦥 �������
: exit				
