/* Supporter Keybinder
- von hannoverboy81 -


*/

version := 1.0
savepath = %A_AppData%\ProgPath\Supporter-Keybinder
ininame = Supporter-Daten.ini
updateserv = http://keybinder.black-evolution.org/Supporter-Keybinder
MyProxy:="" 
nigger=0
Nrd=0
foundon=0
Eingeloggt=0
URLLogin:="http://bekeybinder.net46.net/connection.php" 
URLRegister:="http://bekeybinder.net46.net/register.php"

FileInstall, C:\Users\Julian\Desktop\Supporter-Keybinder\API.dll, API.dll, 1
FileInstall, C:\Users\Julian\Desktop\Supporter-Keybinder\Background.png, %savepath%\Background.png, 1

#include Includes\API.ahk
#include Includes\memlib.ahk
#NoTrayIcon
#SingleInstance, Force
#Persistent
#UseHook
#NoEnv

UrlDownloadToFile, %updateserv%/News.txt, News.txt
FileRead, News, News.txt
FileDelete, News.txt

UrlDownloadToFile, %updateserv%/Deaktiviert.txt, Deaktiviert.txt
FileRead, Deaktiviert, Deaktiviert.txt
FileDelete, Deaktiviert.txt

if A_OSVersion in WIN_2003, WIN_XP, WIN_2000, WIN_NT4, WIN_95, WIN_98, WIN_ME
{
	MsgBox Dieser Keybinder Ben�tigt Windwos Vista/7
	ExitApp
}

if (!StrLen(Wnmp)|| Wnmp=="ERROR")
{
	RegRead,reg, HKEY_LOCAL_MACHINE, SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run,WinampAgent
	SplitPath, reg,, Wnmp1
	StringTrimRight, Wnmp1, Wnmp1, 12
	Wnmp=%Wnmp1%\Winamp.exe"
	StringReplace, Wnmp,Wnmp,",,All
	IniWrite, %Wnmp%, %savepath%\%ininame%, einstellungen, Wnmp
}

if (!StrLen(Pfad) || Pfad=="ERROR")
{
	RegRead GTA_SA_EXE, HKEY_CURRENT_USER, Software\SAMP, GTA_SA_EXE
	SplitPath, GTA_SA_EXE,, Pfad1
	Pfad=%Pfad1%\samp.exe"
	StringReplace, Pfad,Pfad,",,All
	IniWrite, %Pfad%, %savepath%\%ininame%, einstellungen, Pfad
}

;====================================================================== Update System
#include Includes\update.ahk
;====================================================================== Ende
DetectHiddenText, On 
DetectHiddenWindows, On 


IniRead, Nickname, %savepath%\%ininame%, Ingame Daten:, Nickname
IniRead, Passwort, %savepath%\%ininame%, Ingame Daten:, Passwort
IniRead, aPasswort, %savepath%\%ininame%, Ingame Daten:, aPasswort
IniRead, Rang, %savepath%\%ininame%, Ingame Daten:, Rang
IniRead, AD1, %savepath%\%ininame%, Werbungen:, AD1
IniRead, AD2, %savepath%\%ininame%, Werbungen:, AD2
IniRead, AD3, %savepath%\%ininame%, Werbungen:, AD3
IniRead, geschlecht,%savepath%\%ininame%, Einstellungen, geschlecht

newbie1=Hallo %A_UserName% - Vielen Dank, dass du den Supporter Keybinder benutzt!`nBitte stelle die Optionen ein.

If (geschlecht="ERROR")
{
	geschlecht=1
	Hintergrund=1
	IniWrite, %geschlecht%,%savepath%\%ininame%, Einstellungen, geschlecht
	UrlDownloadToFile, %updateserv%/Background.png, %savepath%\Background.png
	msgbox % newbie1
	sleep 1000
}

If (geschlecht = "2") {
	geschlecht=Weiblich
	INIWrite, ihren, %savepath%\%ininame%, Geschlecht, seinen
	INIWrite, ihre, %savepath%\%ininame%, Geschlecht, seine
	weiblichgew�hlt=1
}

If (geschlecht = "1") {
	geschlecht=M�nnlich
	INIWrite, seinen, %savepath%\%ininame%, Geschlecht, seinen
	INIWrite, seine, %savepath%\%ininame%, Geschlecht, seine
	weiblichgew�hlt=0
}

IfNotExist, %savepath%
{
   FileCreateDir, %savepath%
   FileSetAttrib, +H, %savepath%
   FileSetAttrib, +H, %savepath%\%ininame%
}



IniRead, seine,%savepath%\%ininame%, geschlecht, seine
Iniread, seinen,%savepath%\%ininame%, geschlecht, seinen

#include Includes\login.ahk

;====================================================================== Gui
Gui:
Gui, 9:Add, picture, x0 y0 w1000 h600 +backgroundtrans +altsubmit, %savepath%\Background.png
Gui, 9:Add, Text, x800 y5 cRed +backgroundtrans gSchlie�en, [ Schlie�en ]
Gui, 9:Add, Text, x350 y0  w900 h20 gMove +backgroundtrans
Gui, 9:Font, s10
Gui, 9:Add, Text, x12 y30 w300 h50 +backgroundtrans, Supporter Funktionen
Gui, 9:Font, s8
Box1=
(
/ot
/act
/wf
ALT+ F2
ALT + M
ALT + Numpad 1
STRG + Numpad 1
ALT + Numpad 2
ALT + Numpad 3
ALT + Numpad 4
ALT + Numpad 5
ALT + Numpad 6
ALT + Numpad 7
ALT + Numpad 9
ALT + 3
STRG + Numpad 9
STRG + Numpad 3
/fhilfe
)
Gui, 9:Add, Text, x12 y60 w100 h300 +backgroundtrans, %box1%
Box2=
(
Ticket �ffnen
Ticket schlie�en
..weitere Fragen?
Fragen/Probleme im /o
Ticketliste
/addobject Tor
/addobject Schranke
/addobject Rampe
/addobject Fass
/addobject Ebene
/addobject Object
/destroyobject
/eo
/fixveh
Supporter/Admin Liste
Flip
NOS
Freundesliste
)
Gui, 9:Add, Text, x140 y60 w200 h500 +backgroundtrans, %box2%
Gui, 9:Font, s10
Gui, 9:Add, Text, x530 y30 w230 h30 +backgroundtrans, Sonstige Funktionen
Gui, 9:Font, s8
Box3=
(
Numpad 0
Pause
1
/p
/ab
i
p
/aa
F10
F5
/speicher
#
STRG + Komma
STRG + Punkt
Z
)
Gui, 9:Add, Text, x530 y60 w100 h500 +backgroundtrans, %box3%
Box4=
(
Uhrzeit/Time
Keybinder pausieren
Motor ein-/ausschalten
Anruf annehmen
Anrufbeantworter
Telefon ein-/ausschalten
TogLoginLogout ein-/ausschalten
Alles annehmen
Letzten Befehl wiederholen
Einloggen
Wie viel Speicher ist auf C Frei?
Tanken
Zollsystem einschalten
Zollsystem ausschalten
/Zoll
)
Gui, 9:Add, Text, x630 y60 w200 h200 +backgroundtrans, %Box4%
Gui, 9:Add, Button, x2 y550 w160 h30 +backgroundtrans gOptionen, Optionen
Gui, 9:Add, Button, x700 y550 w160 h30 +backgroundtrans gWerbung, Werbungen
Gui, 9:Add, Text, x420 y5 w500 h100 +ReadOnly +backgroundtrans cred, Supporter - Keybinder (v%version%)
Gui, 9:Add, Text, x10 y5 w340 h100 cred +backgroundtrans gForum vForum, Supporter Keybinder by hannoverboy81 (www.Black-Evolution.org)
Gui, 9:Add, Edit, x590 y350 h150 w300 +readonly,%News%
; Generated using SmartGUI Creator for SciTE
#SingleInstance, force
#NoEnv
Gui, 9:+LastFound -Caption
WinSet, Region, 0-0 w900 h600 R30-30
Gui, 9:Show, w900 h600, Supporter Keybinder (v%version%)
return
;====================================================================== Ende
Optionen:
Gui, 9:Destroy
IniRead, geschlecht,%savepath%\%ininame%, Einstellungen, geschlecht
Gui, 2:Add, Text, x21 y10 w230 h20 , Benutzername
Gui, 2:Add, Edit, x21 y30 w230 h20 vIGName, %Nickname%
Gui, 2:Add, Text, x22 y70 w230 h20 , Passwort
Gui, 2:Add, Edit, x22 y90 w230 h20 vIGPass Password, %Passwort%
Gui, 2:Add, Text, x22 y130 w230 h20 , Rangname
Gui, 2:Add, Edit, x22 y145 w230 h20 vRang, %Rang%
Gui, 2:Add, Text, x22 y190 w230 h20 , Admin Passwort
Gui, 2:Add, Edit, x22 y205 w230 h20 vaPasswort Password, %aPasswort%
Gui, 2:Add, Text, x22 y270 w230 h20 , Geschlecht
Gui, 2:Add, DropDownList, x22 y285 w230 h90 vgeschlecht Choose%geschlecht% altsubmit, M�nnlich|Weiblich
Gui, 2:Add, Button, x22 y320 w230 h20 gSpeichern, Speichern
Gui, 2: +LastFound -Caption
GuiID2 := WinExist()
Gui, 2:Show,w300 h350 hide, Optionen
DllCall("AnimateWindow","UInt",GuiID2,"Int",1000,"UInt",AW_VER_NEGATIVE + AW_HOR_NEGATIVE + AW_ACTIVATE)
Gui, 2: +LastFound
Gui, 2:show,,
return
;======================================================================
Forum:
run, http://forum.black-evolution.org/index.php?page=User&userID=70
return
;======================================================================
Werbung:
Gui, 5:Add, Text, x12 y10 w360 h20 , Werbung 1
Gui, 5:Add, Edit, x12 y30 w360 h20 vAD1, %AD1%
Gui, 5:Add, Text, x12 y70 w360 h20 , Werbung 2
Gui, 5:Add, Edit, x12 y90 w360 h20 vAD2, %AD2%
Gui, 5:Add, Text, x12 y130 w360 h20 , Werbung 3
Gui, 5:Add, Edit, x12 y150 w360 h20 vAD3, %AD3%
Gui, 5:Add, Button, x42 y180 w290 h30 gAdSpeichern, Speichern
Gui, 5:Show, w385 h224, Werbungen
return
;======================================================================
AdSpeichern:
Gui, 5:Submit, nohide
GuiControlGet,AD1 ,,AD1
IniWrite, %AD1%, %savepath%\%ininame%, Werbungen: , AD1
IniRead, AD1, %savepath%\%ininame%, Werbungen:, AD1
GuiControlGet,AD2 ,,AD2
IniWrite, %AD2%, %savepath%\%ininame%, Werbungen: , AD2
IniRead, AD2, %savepath%\%ininame%, Werbungen:, AD2
GuiControlGet,AD3 ,,AD3
IniWrite, %AD3%, %savepath%\%ininame%, Werbungen: , AD3
IniRead, AD3, %savepath%\%ininame%, Werbungen:, AD3

DllCall("AnimateWindow", "UInt", guiID5, "Int", 1000 , "UInt", AW_SLIDE + AW_CENTER + AW_HIDE)
Gui, 5:Destroy

Gui, 5: -LastFound
5open=0
reload
return
;======================================================================
Speichern:
Gui, 2:Submit, nohide
GuiControlGet,Nickname ,,IGName
IniWrite, %Nickname%, %savepath%\%ininame%, Ingame Daten: , Nickname
IniRead, Nickname, %savepath%\%ininame%, Ingame Daten:, Nickname
GuiControlGet,Passwort ,,IGPass
IniWrite, %Passwort%, %savepath%\%ininame%, Ingame Daten: , Passwort
IniRead, Passwort, %savepath%\%ininame%, Ingame Daten:, Passwort
GuiControlGet,Rang ,,Rang
IniWrite, %Rang%, %savepath%\%ininame%, Ingame Daten: , Rang
IniRead, Rang, %savepath%\%ininame%, Ingame Daten:, Rang
GuiControlGet,aPasswort ,,aPasswort
IniWrite, %aPasswort%, %savepath%\%ininame%, Ingame Daten: , aPasswort
IniRead, aPasswort, %savepath%\%ininame%, Ingame Daten:, aPasswort

IniWrite, %geschlecht%,%savepath%\%ininame%, Einstellungen, geschlecht
IniRead, %geschlecht%,%savepath%\%ininame%, Einstellungen, geschlecht
		
If (geschlecht = "2") {
        geschlecht=Weiblich
		INIWrite, ihren, %savepath%\%ininame%, Geschlecht, seinen
        INIWrite, ihre, %savepath%\%ininame%, Geschlecht, seine
		weiblichgew�hlt=1
}

If (geschlecht = "1") {
   geschlecht=M�nnlich
   INIWrite, seinen, %savepath%\%ininame%, Geschlecht, seinen
   INIWrite, seine, %savepath%\%ininame%, Geschlecht, seine
   weiblichgew�hlt=0
}

DllCall("AnimateWindow", "UInt", guiID5, "Int", 1000 , "UInt", AW_SLIDE + AW_CENTER + AW_HIDE)
Gui, 2:Destroy

Gui, 2: -LastFound
5open=0
reload
Return
;======================================================================
GuiShowHide:
  If DllCall( "IsWindowVisible", "UInt",GUIID )
 	Gui, Hide
  else
 	Gui, Show
Return
;======================================================================

;======================================================================
Beenden:
Schlie�en:
Schlie�en1:
Schlie�en2:
Schlie�en3:
GuiClose:
	ExitApp
return

;======================================================================

Minimieren:
Minimieren1:
Minimieren2:
Minimieren3:
DllCall("AnimateWindow", "UInt", GuiID, "Int", 1000 , "UInt", AW_SLIDE + AW_CENTER + AW_HIDE)
Gui, Minimize
Gui, Minimize
return
;======================================================================
Move:
Move1:
Move2:
Move3:
PostMessage, 0xA1, 2,,, A
return
;======================================================================
#IfWinActive, GTA:SA:MP
#UseHook
#SingleInstance, Force
;======================================================================


+T:: 
~t::
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Hotkey, t, Off
if(PressedT=1)
{
	Sendinput /a{space}
}
if(PressedT=2)
{
	Sendinput /f{space}
}
if(PressedT=3)
{
	Sendinput /d{space}
}
if(PressedT=4)
{
	Sendinput /r{space}
}
if(PressedT=5)
{
	Sendinput /sup{space}
}
if(PressedT=6)
{
	Sendinput /po{space}
}
return

NumpadEnter::
Enter::
Suspend Permit
Suspend Off
SendInput {Enter}
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return

~Escape::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return
;======================================================================
#include Includes\support.ahk
;======================================================================

;======================================================================
!P::
Pause::
suspend
if ( A_IsSuspended )
{
ShowGameText("~b~Du hast deinen Keybinder ~r~pausiert.", 2000, 3)
}
if ( !A_IsSuspended )
{
ShowGameText("~b~Du hast deinen Keybinder ~g~aktiviert.", 2000, 3)
}       
return


1::
if (Eingeloggt = 1)
{
	if(IsDialogOpen() == 1)
	{
		sendinput 1
		return
	}
	if(IsChatOpen() == 1)
	{
		sendinput 1
		return
	}
	FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\Chatlog.txt
	if(IsDialogOpen() == 1)
	return
	if(IsPlayerInAnyVehicle() == 0)
	return
	if(IsPlayerDriver() == 0)
	{
		AddChatMessage(0x0000FF, "Sie sind nicht der Fahrer dieses Fahrzeugs!")
		return
	}
	if(GetVehicleEngineState() == 0)
	{	
		if(GetVehicleLightState() == 0)
		{
			SendChat("/licht")
			sleep 1
		}
		SendChat("/motor")
		sleep 250
		Loop, read, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
		{
			If Instr(A_LoopReadLine, "Du musst die Handbremse l�sen")
			{
				sendinput {n down}
				sleep 200
				sendinput {n up}
				if(GetVehicleEngineState() == 0)
				{
					SendChat("/me L�st die Handbremse.")
					sleep 1
					SendChat("/motor")
					sleep 1
					SendChat("/me schaltet " seinen " Motor und das Licht ein.")
				}
				return
			}
			else
			{
				SendChat("/me schaltet " seinen " Motor und das Licht ein.")
				return
			}
		}
	}
	else
	{
		if(GetVehicleLightState() == 1)
		{
			SendChat("/licht")
		}
		SendChat("/motor")
		SendChat("/me schaltet " seinen " Motor und das Licht aus.")
	}
} else {
SendChat("/me sollte sich zuerst einloggen **")
}
return

:?:/google::
Suspend Permit
if (Eingeloggt = 1)
{
	Suspend On
	Hotkey, Enter, Off
	sendinput Ihre Google Suche:{space}
	input, Aufnahme, V I M, {enter}
	;AddChatMessage(0x0000FF, "Dr�ck Jetzt nocheinmal Enter damit das Ganze geht!")
	If (Aufnahme!="")
	{
		AddChatMessage(0x0000FF, "Google Suche nach " Aufnahme " Gestartet")
		sleep 5000
		Run,  http://www.google.de/#sclient=psy&hl=de&safe=on&site=&source=hp&q=%Aufnahme%
	}
	else
	{
		AddChatMessage(0x0000FF, "Sie haben nichts Eingegeben.")
	}
	Suspend Off
	Hotkey, t, On
} else {
	SendChat("/me sollte sich zuerst einloggen **")
}
return

	
!Numpad0::
if (Eingeloggt = 1)
{
if(IsChatOpen() == 0 )
{
FormatTime, Uhrzeit,%A_Now%,HH:mm
SendChat("/me schaut auf " seine " Rolex und sieht, dass es " . Uhrzeit . " Uhr ist")
SendChat("/time")
}
} else {
	SendChat("/me sollte sich zuerst einloggen **")
}
return

/*
F5::
FormatTime, Uhrzeit,%A_Now%,HH:mm
		SendInput %Passwort%{enter}
		Sleep, 2000
		SendInput {enter}
FormatTime, Zeit,%A_Now%,HH
	if (Zeit > 5)
	{
		if (Zeit < 12)
		{
			SendChat("Guten Morgen! Du hast dich soeben um " . Uhrzeit . " eingeloggt!")
		}
	}


		if (Zeit > 11)
	{
		if (Zeit < 18)
		{
			SendChat("Guten Tag! Du hast dich soeben um " . Uhrzeit . " eingeloggt!")
		}
	}


		if (Zeit > 17)
	{
		if (Zeit < 25)
		{
			SendChat("Guten Abend! Du hast dich soeben um " . Uhrzeit . " eingeloggt!")
		}
	}
	

	if (Zeit > 0)
	{
		if (Zeit < 6)
		{
			SendChat("Guten Morgen! Du hast dich soeben um " . Uhrzeit . " eingeloggt!")
		}
	}
		SendChat("/members")
		SendChat("/togloginlogout")
		if (login)
		{
			SendChat("/togphone")
		}
		

		return
*/

; ===================================
F5::
IniRead, Variable2, %savepath%\%ininame%, Einstellungen, Variable2
id := GetPlayerId()
sleep 1
ping := GetPlayerPing()
sleep 1
wanted := GetPlayerWanteds()
sleep 1
online := GetOnlinePlayers()
sleep 1
GetServerIp(ip)
sleep 1
score := GetPlayerScore()
sleep 1
money := GetPlayerMoney()
	if (A_Hour > 5)
	{
		if (A_Hour < 12)
		{
			sleep 1
			if(IsDialogOpen() == 1)
			{
				Sendinput %Passwort%{enter}
			}
			else
			{
				return
			}
			sleep 3000
			Sendinput {escape}
			sleep 200
			FormatTime, Time,%A_Now%,
			sleep 200
			SendChat("Hey, " Nickname " ID:" id ". du hast dich soeben eingeloggt.")
			sleep 200
			SetTimer, LInfo, 10000
			sleep 200
			SendChat("wir haben " Time ", Guten Morgen!")
			sleep 200
			SendChat("/togloginlogout")
			ShowGameText("~b~Du hast dich Erfolgreich ~g~Eingeloggt.", 2000, 3)
			return
		}
	}
	if (A_Hour > 11)
	{
		if (A_Hour < 18)
		{
			sleep 1
			if(IsDialogOpen() == 1)
			{
				Sendinput %Passwort%{enter}
			}
			else
			{
				return
			}
			sleep 3000
			Sendinput {escape}
			sleep 200
			FormatTime, Time,%A_Now%,
			sleep 200
			SendChat("Hey, " Nickname " ID: " id ". du hast dich soeben eingeloggt.")
			sleep 200
			SetTimer, LInfo, 10000
			sleep 200
			SendChat("wir haben " Time ", Sch�nen Tag noch!")
			sleep 200
			SendChat("/togloginlogout")
			ShowGameText("~b~Du hast dich Erfolgreich ~g~Eingeloggt.", 2000, 3)
			return
		}
	}
	if (A_Hour > 17)
	{
		if (A_Hour < 22)
		{
			sleep 1
			if(IsDialogOpen() == 1)
			{
				Sendinput %Passwort%{enter}
			}
			else
			{
				return
			}
			sleep 3000
			Sendinput {escape}
			sleep 200
			FormatTime, Time,%A_Now%,
			sleep 200
			SendChat("Hey, " Nickname " ID: " id ". du hast dich soeben eingeloggt.")
			sleep 200
			SetTimer, LInfo, 10000
			sleep 200
			SendChat("wir haben " Time ", Sch�nen Abend :)")
			sleep 200
			SendChat("/togloginlogout")
			ShowGameText("~b~Du hast dich Erfolgreich ~g~Eingeloggt.", 2000, 3)
			return
		}
	}
	if (A_Hour > 21)
	{
		if (A_Hour < 25)
		{
			sleep 1
			if(IsDialogOpen() == 1)
			{
				Sendinput %Passwort%{enter}
			}
			else
			{
				return
			}
			sleep 3000
			Sendinput {escape}
			sleep 200
			FormatTime, Time,%A_Now%,
			sleep 200
			SendChat("Hey, " Nickname " ID: " id ". du hast dich soeben eingeloggt.")
			sleep 200
			SetTimer, LInfo, 10000
			sleep 200
			SendChat("wir haben " Time ", Sch�ne Nacht noch :)")
			sleep 200
			SendChat("/togloginlogout")
			ShowGameText("~b~Du hast dich Erfolgreich ~g~Eingeloggt.", 2000, 3)
			return
		}
	}
	if(A_Hour=0)
	{
		sleep 1
		if(IsDialogOpen() == 1)
		{
			Sendinput %Passwort%{enter}
		}
		else
		{
			return
		}
		sleep 3000
		Sendinput {escape}
		sleep 200
		FormatTime, Time,%A_Now%,
		sleep 200
		SendChat("Hey, " Nickname " ID: " id ". du hast dich soeben eingeloggt.")
		sleep 200
		SetTimer, LInfo, 10000
		sleep 200
		SendChat("wir haben " Time ", Sch�ne Nacht noch :)")
		sleep 200
		SendChat("/togloginlogout")
		ShowGameText("~b~Du hast dich Erfolgreich ~g~Eingeloggt.", 2000, 3)
		return
	}
	if (A_Hour > 0)
	{
		if (A_Hour < 6)
		{
			sleep 1
			if(IsDialogOpen() == 1)
			{
				Sendinput %Passwort%{enter}
			}
			else
			{
				return
			}
			sleep 3000
			Sendinput {escape}
			sleep 200
			FormatTime, Time,%A_Now%,
			sleep 200
			SendChat("Hey, " Nickname " ID: " id ". du hast dich soeben eingeloggt.")
			sleep 200
			SetTimer, LInfo, 10000
			sleep 200
			SendChat("wir haben " Time ", Sch�ne Nacht noch :)")
			sleep 200
			SendChat("/togloginlogout")
			ShowGameText("~b~Du hast dich Erfolgreich ~g~Eingeloggt.", 2000, 3)
			return
		}
	}
	else
	{
		sleep 1
		if(IsDialogOpen() == 1)
		{
			Sendinput %Passwort%{enter}
		}
		else
		{
			return
		}
		sleep 3000
		Sendinput {escape}
		sleep 200
		FormatTime, Time,%A_Now%,
		sleep 200
		SendChat("Hey, " Nickname " ID: " id ". du hast dich soeben eingeloggt.")
		sleep 200
		SetTimer, LInfo, 10000
		sleep 200
		SendChat("wir haben " Time ", Fehler in Time Auslesung!")
		sleep 200
		SendChat("/togloginlogout")
		ShowGameText("~b~Du hast dich Erfolgreich ~g~Eingeloggt.", 2000, 3)
		return
	}
return

LInfo:
sleep 5000
ping1 := GetPlayerPing()
sleep 1
wanted1 := GetPlayerWanteds()
sleep 1
online1 := GetOnlinePlayers()
sleep 1
GetServerIp(ip)
sleep 1
score1 := GetPlayerScore()
sleep 1
money := GetPlayerMoney()
AddChatMessage(0xFFA000, "Aktuell " online1 " Spieler auf " ip " Online, Ihr Ping: " ping1 "")
AddChatMessage(0xFFA000, "Account-Status - Level " score1 " - " wanted1 " Wanteds, Ihr Verm�gen: " money "")
SetTimer, LInfo, Off
return
; ===================================

:?:/aa::
SendInput {enter}
Suspend permit
if (Eingeloggt = 1)
{
SendChat("/accept refill")
SendChat("/accept repair")
SendChat("/accept sex")
SendChat("/accept ticket")
SendChat("/accept drugs")
SendChat("/accept hotdog")
} else {
	SendChat("/me sollte sich zuerst einloggen **")
}
Suspend Off
Hotkey, t, On
return

:?:/pk::
Suspend permit
if (Eingeloggt = 1)
{
SendInput {enter}
SendChat("/p")
SendChat("Guten Tag,")
SendChat("Sie sprechen mit " . nickname . ", " . rang . " der Zivilisten.")
SendChat("Wie kann ich Ihnen helfen?")
} else {
	SendChat("/me sollte sich zuerst einloggen **")
}
suspend off
return

:?:/ab::
Suspend permit
SendInput {enter}
if (Eingeloggt = 1)
{
SendChat("/p")
SendChat("Guten Tag,")
SendChat("Sie sprechen mit " . nickname . ", " . rang . " der Zivilisten.")
SendChat("Aktuell habe ich leider keine Zeit.")
SendChat("Versuchen Sie es bitte sp�ter erneut.")
SendChat("/h")
SendInput {enter}
} else {
	SendChat("/me sollte sich zuerst einloggen **")
}
Suspend Off
Hotkey, t, On
return

i::
if (Eingeloggt = 1)
{
if (IsChatOpen() == 1)
	return
if (IsDialogOpen() == 1)
	return
{
SendChat("/togphone")
}
} else {
	SendChat("/me sollte sich zuerst einloggen **")
}
return

p::
if (Eingeloggt = 1)
{
if (IsChatOpen() == 1)
	return
if (IsDialogOpen() == 1)
	return
{
SendChat("/togloginlogout")
}
} else {
	SendChat("/me sollte sich zuerst einloggen **")
}
return
; =============================================== Objects

!Numpad1::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
SendChat("/addobject Tor")
SendChat("/slap " . Nickname . "")
}
return

^Numpad1::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
	SendChat("/addobject Schranke")
}
return

!Numpad2::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
SendChat("/addobject Rampe")
}
return

!Numpad3::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
SendChat("/addobject Fass")
}
return

!Numpad4::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
SendChat("/addobject Ebene")
}
return

!Numpad5::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
suspend on
SendInput t/addobject Object{space}
KeyWait, enter, D,
suspend off
}
return

!Numpad6::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
SendChat("/destroyobject")
}
return

!Numpad7::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
SendChat("/eo")
}
return

:?:/speicher::
SendInput {enter}
Suspend Permit
DriveSpaceFree, FreeSpace, C:\
EnvDiv,Freespace,1000
SendChat("/b Auf der Festplatte C sind noch " . FreeSpace . " GB frei.")
Suspend on
Hotkey, Enter, On
Hotkey, Escape, On
suspend off
Return

F10::
!q::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
SendInput t{up}{enter}{space}
}
return




!F2::
{
SendChat("/o Du hast Fragen oder Probleme? /sup [Frage/Problem]")
sleep 1000
SendChat("/o Nachdem du das Ticket erstellt hast, wird sich ein Supporter um dein Anliegen k�mmern.")
sleep 1000
SendChat("/o Du m�chtest den Startbonus? Gebe /motd ein und lies dir die Infos durch.")
}
return

F2::
	if(IsPlayerInRangeOfPoint(1786.9869, -1300.2710, 13.4582, 3))
	{
		SendChat("Sie Betreten nun die Hitman Base - viel spa� (:")
		sleep 250
		SendChat("/enter")
		return
	}
	if(IsPlayerInRangeOfPoint(1786.9263, -1300.4066, 120.2656, 3))
	{
		SendChat("Sie Verlassen die Hitman Base, Tsch�ss!")
		sleep 250
		SendChat("/exit")
		return
	}
	SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
	SetPrivileg()
	exe := OpenMemoryFromProcess("gta_sa.exe")
	pointer:=ReadMemory(exe, 0x00B6F5F0) 
	loc := ReadMemory(exe, pointer+47) 
	if(loc > 0)
	{
		SendChat("Sie Befinden sich in einem Geb�ude. (" loc ")")
		sleep 250
		SendChat("/exit")
		sleep 100
	}
	if(loc = 0)
	{
		SendChat("Sie Befinden sich Au�erhalb eines Geb�udes. (" loc ")")
		SendChat("/enter")
		sleep 100
	}
	CloseMemory(exe)
return

!Numpad9::
if(IsChatOpen() == 0 || IsDialogOpen() == 0)
{
SendChat("/fixveh")
}
return

9::
if (IsChatOpen() == 1)
	return
if (IsDialogOpen() == 1)
	return
{
Suspend on
SendInput t/find{space}
Input, Aufnahme, V I M, {enter}
Suspend Off
IniWrite, %Aufnahme%, %savepath%\%ininame%, Finden, Find
}
return

!9::
if (IsChatOpen() == 1)
	return
if (IsDialogOpen() == 1)
	return
{
IniRead, %Aufnahme%, %savepath%\%ininame%, Finden, Find
Loop {
SendChat("/find " . Aufnahme . " ")
Keywait, X, D, T10
		if !errorLevel
		{
		return

	}
}
}
return

~F::
if(IsChatOpen() == 1|| IsDialogOpen() == 1)
	return
if(IsPlayerInAnyVehicle() == 0)
	return
if(IsPlayerDriver() == 0)
	return

if(GetVehicleEngineState() == 1)
	SendChat("/motor")

if(GetVehicleLightState() == 1)
	SendChat("/licht")
return

:?:/ad1::
 
{
Suspend Permit
SendChat("/ad " . AD1 . "")
Suspend off
}
return

:?:/ad2::
 
{
Suspend Permit
SendChat("/ad " . AD2 . "")
Suspend off
}
return

:?:/ad3::
 
{
Suspend Permit
SendChat("/ad " . AD3 . "")
Suspend off
}
return

!1::
 
{
GetPlayerName(name)
id := GetPlayerID()
score := GetPlayerScore()
ping := GetPlayerPing()
GetServerIP(ip)
hp := GetPlayerHealth()
GetCityName(city)
GetZoneName(zone)
spieler := GetOnlinePlayers()

AddChatMessage(0xFFFFFF, "_____ Informationen zum Account _____")
AddChatMessage(0xFFFFFF, "Name:  {FFA000}" name " {FFFFFF}({FFA000}" id "{FFFFFF}) - Level {FFA000}" score "{FFFFFF} - Ping: {FFA000}" ping)
AddChatMessage(0xFFFFFF, "HP:  {FFA000}" hp " {FFFFFF} - Stadt: {FFA000}" city "{FFFFFF} - {FFA000}" zone)
AddChatMessage(0xFFFFFF, "Server:  {FFA000}" ip " {FFFFFF} - Spieler: {FFA000}" spieler " {FFFFFF}")
}
return



!2::
 
{
if(IsChatOpen() == 1 || IsDialogOpen() == 1 || IsMenuOpen() == 1)
	return

ShowDialog(0, "Informationen", "Informationen zum Aktuellen API Release:`n`n`tVersion:{FFA000}`t0.7 {CC0000}Beta`n`t{AAC8E6}Release:`t{FFA000}01.07.2012`n`t{AAC8E6}Developer:`t{FFA000}Santiago_Arganzo", "Verlassen")
}
return

^Numpad9::
if (IsChatOpen() == 1)
	return
if (IsDialogOpen() == 1)
	return
SendChat("/flip")
return

^Numpad3::
if (IsChatOpen() == 1)
	return
if (IsDialogOpen() == 1)
	return
SendChat("/anos")
return

:?:/textb::
Suspend Permit
{
SendInput {Enter}
sleep 50
if(IsChatOpen() == 1 || IsDialogOpen() == 1 || IsMenuOpen() == 1)
	return

ShowDialog(0, "Textbefehle", "/ot = Ticket �ffnen`n/act = Ticket schlie�en`n/hpset = 100 HP setzen`n/sot = Startbonus Ticket`n/wf = weitere Fragen`n/pk = Abnehmen`n/ab = Anrufbeantworter", "Verlassen")
}
Suspend off
Hotkey, t, On
return

#include Includes\fsliste.ahk


;================================================================== 

:?:7a::
Suspend Permit
	Suspend Permit
	Sendinput /a{space}
Return

:?:7goto::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /goto{space}
}
Return

:?:7gethere::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /gethere{space}
}
Return

:?:7aond::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /aond{space}
}
Return

:?:7atv::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /atv{space}
}
Return

:?:7ct::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /ct{space}
}
Return

:?:7ot::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /ot{space}
}
Return

:?:7po::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /po{space}
}
Return

:?:7o::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /o{space}
}
Return

:?:7n::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /n{space}
}
Return

:?:7f::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /f{space}
}
Return

:?:7anim::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /anim{space}
}
Return

:?:7afk::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /afk{space}
}
Return

:?:7back::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /back{space}
}
Return

:?:7bail::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /bail{space}
}
Return

:?:7buygangcar::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /buygangcar{space}
}
Return

:?:7gangcarsell::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /gangcarsell{space}
}
Return

:?:7notafk::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /notafk{space}
}
Return

:?:7enter::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /enter{space}
}
Return

:?:7oparking::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /oparking{space}
}
Return

:?:7exit::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /exit{space}
}
Return

:?:7portable::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /portable{space}
}
Return

:?:7bsnessen::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /bsnessen{space}
}
Return

:?:7buycar::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /buycar{space}
}
Return

:?:7park::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /park{space}
}
Return

:?:7gangcarpark::
Suspend Permit
 
{
	Suspend Permit
	Sendinput /gangcarpark{space}
}
Return

;==================================================================
:?:/winamp::
Suspend Permit
SendChat("/me Benutzt das Keybinder Winamp System von disgrace. **")
sleep 1
SendChat("Mit Numpad 4/6 kannst du Vor/R�ckw�rts das Lied Changen. ")
sleep 1
SendChat("Mit Numpad 7 kannst du Pause/Start Machen. ")
sleep 1
SendChat("Numpad 1 ist Stop. ")
sleep 1
SendChat("Vorw�rts/R�ckw�rts Spulen kannst du mit Numpad 9/3. ")
sleep 1
SendChat("mit Numpad 8/2 kannst du Laut/Leise Machen. ")
sleep 1
SendChat("um zu sehen was du h�rst, klick Numpad 0 ")
Suspend Off
Hotkey, t, On
return

Numpad4::
	if(IsDialogOpen() == 1)
	{
		sendinput 4
		return
	}
	PostMessage, 0x111,40048,,,ahk_class Winamp v1.x 
	Suspend Off
	Hotkey, t, On
return 

Numpad6::
	if(IsDialogOpen() == 1)
	{
		sendinput 6
		return
	}
	PostMessage, 0x111,40044,,,ahk_class Winamp v1.x 
	Suspend Off
	Hotkey, t, On
return 

Numpad7::
	if(IsDialogOpen() == 1)
	{
		sendinput 7
		return
	}
	SendMessage, 0x400,0,104,,ahk_class Winamp v1.x
	Suspend Off
	Hotkey, t, On	
	if errorlevel = 0 
	{ 
		SendMessage, 0x111,40045,,,ahk_class Winamp v1.x 
		Suspend Off
		Hotkey, t, On
	} 
else 
{ 
SendMessage, 0x111,40046,,,ahk_class Winamp v1.x 
Suspend Off
Hotkey, t, On
} 
return

Numpad1::
	if(IsDialogOpen() == 1)
	{
		sendinput 1
		return
	}
	if(IsChatOpen() == 1)
	{
		sendinput 1
		return
	}
	PostMessage, 0x111,40047,,,ahk_class Winamp v1.x 
	Suspend Off
	Hotkey, t, On
return 

Numpad9::
	if(IsDialogOpen() == 1)
	{
		sendinput 9
		return
	}
	if(IsChatOpen() == 1)
	{
		sendinput 9
		return
	}
	SendMessage, 0x400,0,105,,ahk_class Winamp v1.x 
	if errorlevel <> -1 
	{ 
		errorlevel += 5000 
		PostMessage, 0x400,%errorlevel%,106,,ahk_class Winamp v1.x 
		Suspend Off
		Hotkey, t, On
	} 
return 


Numpad3::
	if(IsDialogOpen() == 1)
	{
		sendinput 3
		return
	}
	if(IsChatOpen() == 1)
	{
		sendinput 3
		return
	}
	SendMessage, 0x400,0,105,,ahk_class Winamp v1.x 
	if errorlevel <> -1 
	{ 
	errorlevel -= 5000 
	PostMessage, 0x400,%errorlevel%,106,,ahk_class Winamp v1.x 
	Suspend Off
	Hotkey, t, On
	} 
return

Numpad8::
	if(IsDialogOpen() == 1)
	{
		sendinput 8
		return
	}
	if(IsChatOpen() == 1)
	{
		sendinput 8
		return
	}
	PostMessage, 0x111,40058,,,ahk_class Winamp v1.x 
	Suspend Off
	Hotkey, t, On
return

Numpad2::
	if(IsDialogOpen() == 1)
	{
		sendinput 2
		return
	}
	if(IsChatOpen() == 1)
	{
		sendinput 2
		return
	}
	PostMessage, 0x111,40059,,,ahk_class Winamp v1.x 
	Suspend Off
	Hotkey, t, On
return

Zollsystem:
If (Freigabe = 1)
{
if(IsPlayerInRangeOfPoint(1520.2490,-1766.3677,13.2740,3))
{
	GetVehicleName(PCAR)
	if (IsPlayerDriver() == 0)
	{
		return
	}
	if (IsPlayerInAnyVehicle() == 0)
	{
		return
	}
	SendChat("/fill")
	SendChat("/get fuel")
	ShowGameText("~g~Dein " PCAR " wird betankt!", 5000, 3)
	Freigabe :=0
	Settimer, Z�hler, 1000
	Var :=0
}
}
return
		
Z�hler:
Var++
If (Var = 10)
{
	Settimer, Z�hler, Off
	Freigabe := 1
}
return

Numpad0::
	if(IsDialogOpen() == 1)
	{
		sendinput 0
		return
	}
	if(IsChatOpen() == 1)
	{
		sendinput 0
		return
	}
IfWinExist ,ahk_class Winamp v1.x 
{ 
	WinGetTitle, winamp_title, ahk_class Winamp v1.x
	StringTrimRight, orezan_title, winamp_title, 8
	SendChat("/me H�rt Gerade: " orezan_title "")
	Suspend Off
	Hotkey, t, On
}
return

;============================================ Keybinder-Goto�s

:?:/telecmds::
Suspend Permit
 
{
Suspend Permit
Sendinput {enter}
SendChat("Verf�gbare Bereiche zum Teleportieren:")
SendChat("'lscmds' 'sfcmds' 'lvcmds' 'frakcmds' 'soncmds'")
Suspend Off
Hotkey, t, On
}
return

:?:lscmds::
Suspend Permit
 
{
Suspend Permit
Sendinput /l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat(" K�rzel f�r Teleportation in Los Santos:")
SendChat(" Tankstelle(BSN) = /bt")
SendChat(" Autohaus = /lsah")
SendChat(" Arbeitsamt = /als")
SendChat(" Neulings-Spawn = /noob")
SendChat(" Krankenhaus = /khls")
SendChat(" Bank = /bankls")
SendChat(" Ammunation (Ballas) = /bam")
Suspend Off
Hotkey, t, On
}
return

:?:sfcmds::
Suspend Permit
 
{
Suspend Permit
sendinput {enter}
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat(" K�rzel f�r Teleportation in San Fierro:")
SendChat(" Police Department = /sfpd")
SendChat(" Autohaus = /sfah")
SendChat(" Kirche = /ksf")
SendChat(" Krankenhaus = /khsf")
SendChat(" Bank = /banksf")
SendChat(" Ammunation = /sam")
Suspend Off
Hotkey, t, On
}
return

:?:lvcmds::
Suspend Permit
 
{
Suspend Permit
sendinput {enter}
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat(" K�rzel f�r Teleportation in Las Venturas:")
SendChat(" Fahrschule = /flv")
SendChat(" Gangautohaus = /gah")
SendChat(" Donatorautohaus = /dah")
SendChat(" Police Department = /lvpd")
SendChat(" Flughafen = /lva")
SendChat(" Krankenhaus = /khlv")
SendChat(" Derbyarena = /lvda")
SendChat(" Bank = /banklv")
SendChat(" Ammunation = /lvam")
Suspend Off
Hotkey, t, On
}
return

:?:frakcmds::
Suspend Permit
 
{
Suspend Permit
sendinput {enter}
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat(" K�rzel f�r Teleportation zu Fraktions Basen:")
SendChat(" Red Soldiers = /rs")
SendChat(" Russische Mafia = /rm")
SendChat(" La Cosa Nostra = /lcn")
SendChat(" Vagos = /vagos")
SendChat(" Ballas = /ballas")
SendChat(" Groove Street = /groove")
SendChat(" S.F Rifa = /rifa")
SendChat(" Parkhousedrifter = /phd")
SendChat(" Yakuza die Verstrahlten = /yakuza")
Suspend Off
Hotkey, t, On
}
return

:?:soncmds::
Suspend Permit
 
{
Suspend Permit
sendinput {enter}
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat("/l")
SendChat(" Sonstige K�rzel f�r Teleportation:")
SendChat(" Matspoint SF = /msf")
SendChat(" Gangjail = /gangj")
SendChat(" Drogenfarm = /drogf")
SendChat(" Fleischberg = /fberg")
SendChat(" Knast LS = /knast")
Suspend Off
Hotkey, t, On
}
return




; Los Santos:

:?:/bt::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 990.2090,-921.7618,41.6686")
	Suspend Off
	Hotkey, t, On
}
return

:?:/lsah::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 768.5082,-1344.3613,12.9951")
	Suspend Off
	Hotkey, t, On
}
return

:?:/als::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 512.5085,-1588.0267,15.2170")
	Suspend Off
	Hotkey, t, On
}
return

:?:/noob::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 1193.8986,-1747.9961,13.0530")
	Suspend Off
	Hotkey, t, On
}
return

:?:/khls::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 1193.2837,-1324.2145,12.8863")
	Suspend Off
	Hotkey, t, On
}
return

:?:/bankls::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 1463.9863,-1034.1738,23.1429")
	Suspend Off
	Hotkey, t, On
}
return

:?:/bam::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 1791.5532,-1167.5942,23.3225")
	Suspend Off
	Hotkey, t, On
}
return






; San Fierro:

:?:/sfpd::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -1628.5074,676.3716,6.6667")
	Suspend Off
	Hotkey, t, On
}
return

:?:/sfah::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -1635.9031,1209.8369,6.5233")
	Suspend Off
	Hotkey, t, On
}
return

:?:/ksf::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -1966.0494,1094.9119,55.0343")
	Suspend Off
	Hotkey, t, On
}
return

:?:/khsf::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -2654.5425,624.4468,13.9399")
	Suspend Off
	Hotkey, t, On
}
return

:?:/banksf::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -1748.2203,847.4321,24.2138")
	Suspend Off
	Hotkey, t, On
}
return

:?:/sam::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -2626.6995,217.4488,3.9381")
	Suspend Off
	Hotkey, t, On
}
return





; Las Venturas:

:?:/flv::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 651.9530,1732.4072,6.0133")
	Suspend Off
	Hotkey, t, On
}
return

:?:/gah::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 1692.4375,1051.9567,10.3081")
	Suspend Off
	Hotkey, t, On
}
return

:?:/dah::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 2034.4993,1008.1577,10.3049")
	Suspend Off
	Hotkey, t, On
}
return

:?:/lvpd::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 2288.6841,2422.5745,10.2906")
	Suspend Off
	Hotkey, t, On
}
return

:?:/lva::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 1683.2369,1603.5654,10.3076")
	Suspend Off
	Hotkey, t, On
}
return

:?:/khlv::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat(" 1583.8542,1835.0717,10.3121")
	Suspend Off
	Hotkey, t, On
}
return

:?:/lvda::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 1097.9283,1610.6057,12.0388")
	Suspend Off
	Hotkey, t, On
}
return

:?:/banklv::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 952.0851,1732.4369,8.1354")
	Suspend Off
	Hotkey, t, On
}
return

:?:/lvam::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 2154.9495,943.1426,10.3096")
	Suspend Off
	Hotkey, t, On
}
return





; Fraktionen:

:?:/rs::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 701.2105,-1219.7513,17.0974")
	Suspend Off
	Hotkey, t, On
}
return

:?:/rm::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 261.3897,-1361.3759,53.1094")
	Suspend Off
	Hotkey, t, On
}
return

:?:/lcn::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 301.5903,-1170.5612,80.9099")
	Suspend Off
	Hotkey, t, On
}
return

:?:/ballas::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 1969.9083,-1134.9475,25.2877")
	Suspend Off
	Hotkey, t, On
}
return

:?:/groove::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 2496.7231,-1669.5485,12.8227")
	Suspend Off
	Hotkey, t, On
}
return

:?:/rifa::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -2728.5129,-310.3295,6.5245")
	Suspend Off
	Hotkey, t, On
}
return

:?:/vagos::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 2524.2136,-1044.6565,68.8832")
	Suspend Off
	Hotkey, t, On
}
return

:?:/phd::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 2319.0137,1899.8241,10.1632")
	Suspend Off
	Hotkey, t, On
}
return

:?:/yakuza::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 2530.1987,1822.9105,10.8203")
	Suspend Off
	Hotkey, t, On
}
return

; Sonstiges:

:?:/msf::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -1091.3019,-1621.8108,75.8371")
	Suspend Off
	Hotkey, t, On
}
return

:?:/gangj::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -375.8564,-1441.9335,25.2133")
	Suspend Off
	Hotkey, t, On
}
return

:?:/drogf::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords -105.6340,-75.8656,2.6040")
	Suspend Off
	Hotkey, t, On
}
return

:?:/fberg::
Suspend Permit
 
{
	Suspend Permit
	Sendinput {enter}
	SendChat("/gotocoords 63.5562,-250.2458,1.0508")
	Suspend Off
	Hotkey, t, On
}
return

:?:/knast::
Suspend Permit
 
{
	Suspend Permit
	SendChat("/setint 6")
	sleep 500
	SendChat("/gotocoords 264.0874,77.9421,1001.0391")
	Suspend Off
	Hotkey, t, On
}
return

;========================================= 

/*
^,::
ShowGameText("~b~Zollsystem ~g~eingeschaltet.", 2000, 3)
TextBindTimer(150)
RegisterTextBind("Willkommen in der Adminbase! Bitte nach der Nutzung das Auto zerst�ren.", 1247.6981,-811.0828,84.1406, 10, 1, 10000, 1)
RegisterTextBind("/fill", 1004.9371,-939.6054,41.9068, 5, 1, 10000, 1)
RegisterTextBind("/fill", 1520.2490,-1766.3677,13.2740, 5, 1, 10000, 1)
RegisterTextBind("/atm", 1193.851563,-917.276367,43.166012, 1, 1, 10000, 1)
RegisterTextBind("/atm", 771.468811,-1383.541870,13.697599, 1, 1, 10000, 1)
RegisterTextBind("/drivein", 1181.370972,-902.176025,42.814190, 1, 1, 10000, 1)
RegisterTextBind("Hier wohnt der Ersteller des Keybinders!", 832.513916,-860.359680,69.388039, 5, 1, 10000, 1)
return
*/


:?:/saveit::
Suspend Permit
hotkey, enter, off
sendinput {space}
input, Aufnahme, V I M,{enter}
Iniwrite, %Aufnahme% , %savepath%\%ininame%, Coords, Name
IniRead, Aufnahme,%savepath%\%ininame%, Coords, Name
sleep 100
GetPlayerPos(x, y, z, r)
IniWrite, %x%, %savepath%\%Aufnahme%.ini, Coords: , x
IniWrite, %y%, %savepath%\%Aufnahme%.ini, Coords: , y
IniWrite, %z%, %savepath%\%Aufnahme%.ini, Coords: , z
return

/*
^.::
UnregisterAllTextBinds()
ShowGameText("~b~Zollsystem ~g~abgeschaltet.", 2000, 3)
return
*/
; =================================================
:?:/rc::
Suspend Permit
	if (Pfad="\samp.exe")
	{
		Suspend permit
		sendinput /q{enter}
		Sleep 5000
		Suspend Off
		Hotkey, t, On
		run samp://46.251.236.250:7777 -n%LUsername%, %PFAD%
		sleep 500
send	{left}
send	{enter}
	}
	else
	{
		Suspend permit
		sendinput /q{enter}
		Sleep 5000
		Suspend Off
		Hotkey, t, On
		Process , exist, samp.exe
		Process, Close, %errorLevel%
		Run, %Pfad% 46.251.236.250:7777 -n%LUsername%, %PFAD%
	}
return

#::
GetVehicleName(PCAR)
SendChat("/fill")
sleep 100
ShowGameText("~g~Dein " PCAR " wird betankt", 2000, 3)
return

^,::
SetTimer, Zollsystem, 100
ShowGameText("~b~Zollsystem ~g~aktiviert.", 2000, 3)
return

^.::
SetTimer, Zollsystem, Off
ShowGameText("~b~Zollsystem ~r~deaktiviert.", 2000, 3)
return

z::
if (IsChatOpen() == 1 || IsDialogOpen() == 1)
{
	SendInput z
	return
}
SendChat("/zoll")
return



