@echo off     

SET flag=%1%
SET bool=%2%
:menu     
if %flag%==�� cls   
echo 1. ��ࠢ��  � ������� HELP
echo 2. ���������� ������� HELP TYPE
echo 3. ���������� ������� HELP DIR
echo 4. ���������� ������� HELP EXIT
echo 5. ���������� ������� HELP REM   
echo 6. ��室  
echo 7. ��� ������� �� �����    

REM ������ ������� �������
choice /C:1234567 /M  "������ ����� �㭪�: "

if ERRORLEVEL 7 goto 7
if ERRORLEVEL 6 goto 6
if ERRORLEVEL 5 goto 5
if ERRORLEVEL 4 goto 4
if ERRORLEVEL 3 goto 3
if ERRORLEVEL 2 goto 2
if ERRORLEVEL 1 goto 1
goto fin

:1
echo 1 
set bool=1   
echo  ����祭�� �ࠢ�� � �������� � ���४⨢��
SET flag=1
pause
goto menu

:2
echo 2
TYPE/?
pause
goto menu

:3
echo 3
DIR/?
pause
goto menu

:4
echo 4
REM/?
pause
goto menu

:5
echo 5
EXIT/?
pause
goto menu    
                                                                                                                                                                                           

:6
echo 6
if %bool%==�� (help echo)  
ECHO �����襭�� �ணࠬ��  
pause

:7
echo 7 
CALL %3  
goto menu
pause