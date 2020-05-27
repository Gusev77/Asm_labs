@echo off     

SET flag=%1%
SET bool=%2%
:menu     
if %flag%==Да cls   
echo 1. Справка  о команде HELP
echo 2. Демонстарция команды HELP TYPE
echo 3. Демонстарция команды HELP DIR
echo 4. Демонстарция команды HELP EXIT
echo 5. Демонстарция команды HELP REM   
echo 6. Выход  
echo 7. Доп задание на защиту    

REM ЗАПРОС НАЖАТИЯ КЛАВИШИ
choice /C:1234567 /M  "Введите номер пункта: "

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
echo  Получение справки о командах и диррективах
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
if %bool%==Да (help echo)  
ECHO Завершение программы  
pause

:7
echo 7 
CALL %3  
goto menu
pause