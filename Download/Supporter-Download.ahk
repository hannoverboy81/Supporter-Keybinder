; ***************************
; Supporter-Keybinder Downloader
; ***************************

#SingleInstance, Force

if not A_IsAdmin
{
   DllCall("shell32\ShellExecuteA", uint, 0, str, "RunAs", str, A_ScriptFullPath
      , str, """" . A_ScriptFullPath . """", str, A_WorkingDir, int, 1)
	MsgBox, 64, Administrator, Keybinder nicht als Administrator ausgeführt. Programm wird Beendet, 3
    ExitApp
}

updateserv = http://keybinder.black-evolution.org/Supporter-Keybinder

UrlDownloadToFile, %updateserv%/FSize.txt, %savepath%\FSize.txt
FileRead, FSize, %savepath%\FSize.txt
FileDelete, %savepath%\FSize.txt

Gui, Add, Text, cWhite x100 y100, 
Gui, Add, Text, x5 y5, Supporter-Keybinder Download
Gui, Add, Button, x12 y50 w160 h25 gWeiter, Download
Gui,Show,, Download
return

Weiter:
FileSelectFolder, folder, , 3, Speicherort Auswählen:
Gui, Add,Progress,x0 y0 w200 h20 vProgress1 -Smooth cDefault,0
Gui, Add,Text,x0 y20 w200 h20 vText1,0`%
Gui, Show,w200 h40,Download
SetTimer,Updater,100
URLDownloadToFile,%updateserv%/Supporter-Keybinder.exe,%folder%\Supporter-Keybinder.exe
return

Updater:
	IfExist,%folder%\Supporter-Keybinder.exe
	{
		FileGetSize,AktSize,%folder%\Supporter-Keybinder.exe,K
		If(K==0)
		{
			Return
		}
		Pos:=Round((AktSize/FSize)*100)
		If(Pos==100)
		{
			GuiControl,,Progress1,100
			GuiControl,,Text1,100`%
			SetTimer,Updater,Off
			MsgBox,32,OK!, Download Abgeschlossen!
			ExitApp
		}
		GuiControl,,Progress1,%Pos%
		GuiControl,,Text1,%Pos%`%
	}
	return
	
	GuiClose:
	ExitApp
	return