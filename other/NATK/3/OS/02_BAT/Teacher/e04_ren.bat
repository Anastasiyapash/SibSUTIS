@echo off 			
if  -%1 == -  goto no_param1	
if  -%2 == -  goto no_param2	
if not exist %1 goto not_exist
if exist %2 goto yes_exist
echo === ��२��������� ��⠫��� %1 ===	
ren %1 %2
goto exit			
: no_param1			
echo ������ ���� ����� ��२���㥬� ��⠫��
goto exit			
: no_param2			
echo ������� ���� ������ ��� ������ ��⠫���
goto exit			
: not_exist		
echo ��⠫�� %1 �� ������		
goto exit			
: yes_exist		
echo ��⠫�� � ������ %2 㦥 �������
: exit				
