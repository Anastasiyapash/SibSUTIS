@echo off 			
rem shift			
if  -%1 == -  goto no_param1	
if  -%2 == -  goto no_param2	
if  -%3 == -  goto no_param3	
if not exist %2 goto not_exist2
if exist %3 goto not_exist3
echo === ����஢���� 䠩�� %2 �� ⥪�饣� ��⠫��� � �����⠫�� %1 ===	
md %1
copy %2 %1\
echo === ��६�饭�� 䠩�� %3 �� �����⠫��� � ⥪�騩 ��⠫�� ===
move %1\%2 %3	
echo === �������� 䠩�� %3 � �����⠫��� %1 ===	
del %3
rd %1
goto exit			
: no_param1			
echo ������ ���� ����� �����⠫��
goto exit			
: no_param2			
echo ������ ���� ����� �����㥬� 䠩� �� ⥪�饣� ��⠫��� 
goto exit			
: no_param3			
echo ������ ���� ����� ��६�頥�� 䠩� �� �����⠫��� %2 � ��⠫��
goto exit			
: not_exist2			
echo ���� %2 � ⥪�饬 ��⠫��� �� ������		
goto exit			
: yes_exist3
echo ���� %3 � ⥪�饬 ��⠫��� 㦥 �������		
: exit				
