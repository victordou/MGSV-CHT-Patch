@shift /0
@echo off
@chcp 65001>nul
if exist .\MgsGroundZeroes.exe (
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
    @del /f /q mgsvgz.bat>nul
    exit
)

:hdfont
mode con cols=77 lines=25
title 《合金装备V：原爆点》官方汉化100％最终版（日版同款高清字体）
ECHO.
ECHO. 《合金装备V：原爆点》官方汉化100％最终版（日版同款高清字体） 
ECHO.
ECHO. =====================================================================
ECHO.
ECHO. ·100％利用PS4最新版全部官方翻译中文文本，只在官方未翻、明显错误、 
ECHO.  PC版独有之处与官方不同； 
ECHO.
ECHO. ·纯手工补字日版同款高清字体，与PS4日文版相同的文字视觉体验； 
ECHO.
ECHO. ·完美适配英/日两种语音版本，追加日配版独占磁带汉化； 
ECHO.
ECHO. ·图片部分汉化使用PS4版官方高清贴图，附加主线片尾歌词图片汉化； 
ECHO.
ECHO. ·兼容最新Steam正版、CODEX/CPY 1.0/1.0.0.3/1.0.0.5版。 
ECHO.
ECHO. 汉化文件整合来自feya https://bbs.3dmgame.com/thread-6474498-1-1.html 
ECHO. 脚本来自cgzero，提取自scph_50001，在Bing AI协助下修改完成 
ECHO.
ECHO.                                                    Victor 2024年1月 
ECHO. _____________________________________________________________________
@echo 请按任意键执行汉化 
@pause>nul
@ren .\patch\data_02\data\as\tpp\font_hd font
@ren .\patch\data_02\Assets\tpp\pack\ui\gz\gz_ui_resident_data_hd.fpkd gz_ui_resident_data.fpkd
goto start

:ps4font
mode con cols=77 lines=25
title 《合金装备V：原爆点》官方汉化100％最终版（PS4官方中文高清字体）
ECHO.
ECHO. 《合金装备V：原爆点》官方汉化100％最终版（PS4官方中文高清字体） 
ECHO.
ECHO. =====================================================================
ECHO.
ECHO. ·100％利用PS4最新版全部官方翻译中文文本，只在官方未翻、明显错误、 
ECHO.  PC版独有之处与官方不同； 
ECHO.
ECHO. ·PS4官方中文字体界面+字幕外观显示参数修正，与PS4实机字体尺寸一致； 
ECHO.
ECHO. ·完美适配英/日两种语音版本，追加日配版独占磁带汉化； 
ECHO.
ECHO. ·图片部分汉化使用PS4版官方高清贴图，附加主线片尾歌词图片汉化； 
ECHO.
ECHO. ·兼容最新Steam正版、CODEX/CPY 1.0/1.0.0.3/1.0.0.5版。 
ECHO.
ECHO. 汉化文件整合来自feya https://bbs.3dmgame.com/thread-6474498-1-1.html 
ECHO. 脚本来自cgzero，提取自scph_50001，在Bing AI协助下修改完成 
ECHO.
ECHO.                                                    Victor 2024年1月 
ECHO. _____________________________________________________________________
@echo 请按任意键执行汉化 
@pause>nul
@ren .\patch\data_02\data\as\tpp\font_ps4 font
@ren .\patch\data_02\Assets\tpp\pack\ui\gz\gz_ui_resident_data_ps4.fpkd gz_ui_resident_data.fpkd
goto start

:start
@cls
@echo 请稍候，正在汉化中...
@MGSV_QAR_Tool data_01.g0s -r>nul
@MGSV_QAR_Tool data_02.g0s -r>nul
if exist .\data_01.g0s.bak (
    @echo data_01.g0s备份已存在，跳过备份操作...
) else ( 
    @ren data_01.g0s data_01.g0s.bak
)
if exist .\data_02.g0s.bak (
    @echo data_02.g0s备份已存在，跳过备份操作...
) else ( 
    @ren data_02.g0s data_02.g0s.bak
)
@xcopy /Y .\patch .\ /e>nul
@MGSV_QAR_Tool data_01.inf -r>nul
@MGSV_QAR_Tool data_02.inf -r>nul
@echo 汉化完成...
@ping /n 1 127.1>nul
@echo 正在清理临时文件中...
@rd /s /q data_01>nul
@del /f /q data_01.inf>nul
@rd /s /q data_02>nul
@del /f /q data_02.inf>nul
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
@del /f /q mgsvgz.bat>nul
exit