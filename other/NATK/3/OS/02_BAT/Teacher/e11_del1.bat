@echo off 			
rem shift			
if  -%1 == -  goto no_param	
if not exist %1 goto not_exist
echo === �������� 䠩�� %1 ===	
del %1
goto exit			
: no_param			
echo ������ ���� ����� 䠩� ��� 㤠����� 
goto exit			
: not_exist			
echo ����塞� 䠩� %1 �� ������		
: exit				
