@echo off
 
:: 获取文件名部分 (不含扩展名)
for %%a in ("%CD%") do set current_dir=%%~nxa
echo %current_dir%

:: 获取当前目录的名称 
set zip_file=%current_dir%.zip

:: 设置需要压缩的目录
set source_dir=.\output\

:: 设置目标服务器和共享目录
set target_path=..\deploy\ig\compiled\

:: 检查压缩工具是否存在，这里以 7-Zip 为例
if not exist "C:\Program Files\7-Zip\7z.exe" (
    echo can't found 7-zip program
    pause
    exit /b
)

:: 压缩目录
"C:\Program Files\7-Zip\7z.exe" a "%zip_file%" "%source_dir%\"

:: 复制压缩文件到目标服务器
xcopy "%zip_file%" "%target_path%" /y

del "%zip_file%"

rd /s /q "%source_dir%"

echo complete