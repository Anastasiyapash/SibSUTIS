@echo off 			
if  -%1 == -  goto no_param1	
if not exist %1 goto not_exist1
if  -%2 == -  goto no_param2	
if not exist %1\%2 goto not_exist2
echo === ��ਡ��� 䠩�� %2 � ��⠫��� %1 ===	
attrib %1\%2
goto exit			
: no_param1			
echo ������ ���� ����� ��⠫��
goto exit			
: no_param2			
echo ������� ���� ������ ��� 䠩�� � ��⠫��� %1
goto exit			
: not_exist1		
echo ��⠫�� %1 �� ������		
goto exit			
: not_exist2
echo ��� 䠩�� %1\%2 �� �������
: exit				
