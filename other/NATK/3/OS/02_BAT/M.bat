@echo off 			
rem shift			
if  -%1 == -  goto no_param	
if not exist %1 goto not_exist	
type %1				
goto exit			
: no_param			
echo ������ ���� ����� ��ࠬ���	
goto exit			
: not_exist			
echo ���� %1 �� ������		
: exit				
