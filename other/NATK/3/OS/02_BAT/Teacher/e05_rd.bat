@echo off 			
if  -%1 == -  goto no_param	
if not exist %1 goto not_exist
rem echo === �������� 䠩��� �� ��⠫��� %1 ===	
rem del %1\*.*
echo === �������� ��⠫��� %1 ===	
rd /S /Q %1
goto exit			
: no_param			
echo ������ ���� ����� 㤠�塞� ��⠫��
goto exit			
: not_exist		
echo ��⠫�� %1 �� ������		
: exit				
