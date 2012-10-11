Filedelete,update.bat

UrlDownloadToFile,%updateserv%/version.txt, version.txt
FileRead, newver, version.txt
IniRead, Nickname, %savepath%\%ininame%, Ingame Daten:, Nickname
FileDelete, version.txt
if (version < newver)
  {
	newververfügbar := 1
	MsgBox, 4,Aktualisierung des Keybinders, Hallo %A_UserName%,`n`nEs ist eine neuere Version des Supporter Keybinders verfügbar, (Version %newver%).`nMöchtest du diese jetzt herunterladen?
	IfMsgBox, Yes
	{

		MsgBox, 64, Downloadprozess, Das Update wird nun heruntergeladen, dies kann bis zu 20 Sekunden dauern..., 3
		Urldownloadtofile,%updateserv%/Supporter-Keybinder.exe, %A_ScriptName%.new
		BatchFile=
		(
		Ping 127.0.0.1
		Del "%A_ScriptName%"
		Rename "%A_ScriptName%.new" "%A_ScriptName%"
		cd "%A_ScriptFullPath%"
		"%A_ScriptName%"
		Del update.bat
		)

		FileDelete,update.bat
		FileAppend,%BatchFile%,update.bat
		MsgBox, 64, Ausführung des Updates, Der neue Keybinder wird nun für den ersten Start vorbereitet..., 3
		Run,update.bat,,hide
		Exitapp
		}
	}
else
  {
	newververfügbar := 0
}