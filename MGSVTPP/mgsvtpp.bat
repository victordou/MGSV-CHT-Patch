@shift /0
@echo off
@chcp 65001>nul
if exist .\mgsvtpp.exe (
    @echo 请选择游戏的字体 
    @echo 1.日版同款高清字体，字体美观，与日版体验一致 
    @echo 2.PS4官方中文高清字体，字体大，港版中文体验 
    @choice /c 12 /n /m "请输入你的选择 (倒计时5秒)" /T 5 /D 1
    if errorlevel 2 goto ps4font
    goto hdfont
) else (
    @echo 请将汉化补丁放在游戏安装目录中执行，按任意键退出 
    @pause>nul
    @rd /s /q patch>nul
    @del /f /q dictionary.txt>nul
    @del /f /q MGSV_QAR_Tool.exe>nul
    @del /f /q pathid_list_ps3.bin>nul
    @del /f /q zlib1.dll>nul
    @del /f /q msvcp100.dll>nul
    @del /f /q msvcr100.dll>nul
    @del /f /q mgsvtpp.bat>nul
    exit
)

:hdfont
mode con cols=77 lines=26
title 《合金装备V：幻痛》官方汉化100％最终版（日版同款高清字体）
ECHO.
ECHO. 《合金装备V：幻痛》官方汉化100％最终版（日版同款高清字体） 
ECHO.
ECHO. =====================================================================
ECHO.
ECHO. ·100％利用PS4最新版全部官方翻译中文文本，只在官方未翻、明显错误、 
ECHO.  PC版独有之处保留部分delta333的翻译； 
ECHO.
ECHO. ·纯手工补字日版同款高清字体，与PS4日文版相同的文字视觉体验； 
ECHO.
ECHO. ·字库补齐官方缺字，FOB通知、公告日文正常显示； 
ECHO.
ECHO. ·追加图片部分官方汉化； 
ECHO.
ECHO. ·附加日文版独有歌词图片汉化； 
ECHO.
ECHO. ·兼容最新Steam正版、CPY 1.10、EMPRESS 1.15、CODEX 1.15 版； 
ECHO.
ECHO. 汉化文件整合来自feya https://bbs.3dmgame.com/thread-6474498-1-1.html 
ECHO. 脚本来自cgzero，提取自scph_50001，在Bing AI协助下修改完成 
ECHO.
ECHO.                                                    Victor 2024年1月 
ECHO. _____________________________________________________________________
ECHO.
@echo 请按任意键执行汉化 
@pause>nul
@ren .\patch\00-hd.txt 00.txt
@del /f /q .\patch\00-ps4.txt>nul
@ren .\patch\00\Assets\tpp\font_hd font
goto start

:ps4font
mode con cols=77 lines=26
title 《合金装备V：幻痛》官方汉化100％最终版（PS4官方中文高清字体）
ECHO.
ECHO. 《合金装备V：幻痛》官方汉化100％最终版（PS4官方中文高清字体） 
ECHO.
ECHO. =====================================================================
ECHO.
ECHO. ·100％利用PS4最新版全部官方翻译中文文本，只在官方未翻、明显错误、 
ECHO.  PC版独有之处保留部分delta333的翻译； 
ECHO.
ECHO. ·PS4官方中文字体界面+字幕外观显示参数修正，与PS4实机字体尺寸一致； 
ECHO.
ECHO. ·追加图片部分官方汉化； 
ECHO.
ECHO. ·附加日文版独有歌词图片汉化； 
ECHO.
ECHO. ·兼容最新Steam正版、CPY 1.10、EMPRESS 1.15、CODEX 1.15 版； 
ECHO.
ECHO. 汉化文件整合来自feya https://bbs.3dmgame.com/thread-6474498-1-1.html
ECHO. 脚本来自cgzero，提取自scph_50001，在Bing AI协助下修改完成 
ECHO.
ECHO.                                                    Victor 2024年1月 
ECHO. _____________________________________________________________________
ECHO.
@echo 请按任意键执行汉化 
@pause>nul
@ren .\patch\00-ps4.txt 00.txt
@del /f /q .\patch\00-hd.txt>nul
@ren .\patch\00\Assets\tpp\font_ps4 font
goto start

:start
@cls
@echo 请稍候，正在汉化中...
@MGSV_QAR_Tool .\master\0\00.dat -r>nul
@MGSV_QAR_Tool .\master\0\01.dat -r>nul
if exist .\master\0\00.dat.bak (
    @echo 00.dat备份已存在，跳过备份操作...
) else (
    @ren .\master\0\00.dat 00.dat.bak
)
if exist .\master\0\01.dat.bak (
    @echo 01.dat备份已存在，跳过备份操作...
) else (
    @ren .\master\0\01.dat 01.dat.bak
)
@xcopy /Y .\patch .\master\0\ /e>nul
@findstr /v /i /x /g:.\master\0\00.inf .\master\0\00.txt > .\master\0\00diff.txt
@type .\master\0\00diff.txt >> .\master\0\00.inf
@findstr /v /i /x /g:.\master\0\01.inf .\master\0\01.txt > .\master\0\01diff.txt
@type .\master\0\01diff.txt >> .\master\0\01.inf
@MGSV_QAR_Tool .\master\0\00.inf -r>nul
@MGSV_QAR_Tool .\master\0\01.inf -r>nul
@echo 汉化完成...
@ping /n 1 127.1>nul
@echo 正在清理临时文件中...
@rd /s /q .\master\0\00>nul
@del /f /q .\master\0\00.inf>nul
@del /f /q .\master\0\00.txt>nul
@del /f /q .\master\0\00diff.txt>nul
@rd /s /q .\master\0\01>nul
@del /f /q .\master\0\01.inf>nul
@del /f /q .\master\0\01.txt>nul
@del /f /q .\master\0\01diff.txt>nul
@echo 临时文件清理完成...
@echo 已完成汉化，按任意键退出 

@pause>nul
@rd /s /q patch>nul
@del /f /q dictionary.txt>nul
@del /f /q MGSV_QAR_Tool.exe>nul
@del /f /q pathid_list_ps3.bin>nul
@del /f /q zlib1.dll>nul
@del /f /q msvcp100.dll>nul
@del /f /q msvcr100.dll>nul
@del /f /q mgsvtpp.bat>nul
exit