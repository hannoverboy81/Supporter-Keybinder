Hauptgui:
Gui ,Add, Tab, x12 y10 w230 h140 , Login|Register|Game|Info
Gui ,Tab, Login 
Gui ,Add, Text, x22 y40 w100 h20 , Benutzername: 
Gui ,Add, Text, x22 y60 w60 h20 , Passwort: 
Gui ,Add, Edit, x132 y40 w100 h20 vLUsername, 
Gui ,Add, Edit, x132 y60 w100 h20 vLPassword Password, 
;Gui, Add, Checkbox, x132 y90 vdaten cBlack Checked%daten%, disgrace. Hier!
;Gui, Add, Checkbox, x22 y90 vdaten2 cBlack Checked%daten2%, .Bullet Hier!
Gui ,Add, Button, x82 y110 w100 h30 gLogin, Login 
Gui ,Tab, Register 
Gui ,Add, Text, x22 y40 w100 h20 , Benutzername: 
Gui ,Add, Text, x22 y60 w60 h20 , Passwort: 
Gui ,Add, Text, x22 y80 w100 h30 , Passwort Wiederholen: 
Gui ,Add, Edit, x132 y40 w100 h20 vRUsername, 
Gui ,Add, Edit, x132 y60 w100 h20 vRPassword Password, 
Gui ,Add, Edit, x132 y80 w100 h20 vCRPassword Password, 
Gui ,Add, Button, x132 y110 w100 h30 gRegister, Registrieren 
Gui ,Tab, Game
Gui ,Add, Text, x22 y40 w100 h20 , SAMP Name: 
Gui ,Add, Text, x22 y60 w60 h20 , Passwort: 
Gui ,Add, Text, x22 y80 w100 h30 , Passwort Wiederholen: 
Gui ,Add, Edit, x132 y40 w100 h20 vSName, 
Gui ,Add, Edit, x132 y60 w100 h20 vSPassword Password, 
Gui ,Add, Edit, x132 y80 w100 h20 vSRPassword Password, 
Gui ,Add, Button, x132 y110 w100 h30 gsampacc, Speichern 
Gui ,Tab, Info
Gui ,Add, Text, x22 y40 w210 h100 ,Keybinder von hannoverboy81.`nv%version%`nunter Game Acc-Daten Speichern!`nServer Aktiv: Black-Evolution
Gui ,Show,h161 w256 ,Supporter-Keybinder (v%version%)
return 

Login: 
Gui, Submit
IniWrite, %daten%,%savepath%\%ininame%, einstellungen, daten
If (Deaktiviert="1")
{
	MsgBox, 16, Error, Login vorrübergehend Deaktiviert!
	ExitApp
	return
}

UrlOutputVar:=    
LoginInfo:=       
LineArray:=       
GuiControlGet, LUsername , , LUsername 
GuiControlGet, LPassword , , LPassword 
UrlDownloadToVar(URLLogin . "?benutzername=" . LUsername . "&passwort=" . LPassword . "&admin=" . LAdmin,UrlOutputVar,,MyProxy) 
StringSplit, LineArray, UrlOutputVar, %Return% 
LoginInfo:=LineArray1 
If (LoginInfo="0") 
{
	MsgBox, 16, Error, Der Account %LUsername% existiert nicht!
	reload
}
If (LoginInfo="1") 
{ 
	MsgBox, 32, OK, Erfolgreich Eingeloggt - Willkommen %LUsername%!
	Eingeloggt=1
	IniRead, LPassword, %savepath%\%ininame%, Einstellungen, Password
	GoSub,Gui 
	return
}
If (LoginInfo="2") 
{
	MsgBox, 16, Error, Das Passwort stimmt nicht mit dem Account %LUsername% überein.
	reload
}
If (LoginInfo="3") 
{
	MsgBox, 16, Error, Der Account %LUsername% ist noch nicht freigegeben!
	reload
}
return 

Register: 
UrlOutputVar:=    
RegisterInfo:=    
LineArray:=       
GuiControlGet, RUsername , , RUsername 
GuiControlGet, RPassword , , RPassword 
GuiControlGet, CRPassword , , CRPassword 
If (CRPassword<>RPassword)  
{ 
MsgBox,16,Error, Die Passwörter stimmen nicht überein `n`n Passwort: %RPassword% `n Wiederholung: %CRPassword%
return 
} 
;Debug Info 
;MsgBox,% URLRegister . "?benutzername=" . RUsername . "&passwort=" . RPassword 
UrlDownloadToVar(URLRegister . "?benutzername=" . RUsername . "&passwort=" . RPassword,UrlOutputVar,,MyProxy) 
StringSplit, LineArray, UrlOutputVar, %Return% 
RegisterInfo:=LineArray1 
;Debug Info 
;MsgBox, Result:=%RegisterInfo% 
If (RegisterInfo="0") 
MsgBox, 16, Error, Registration fehlgeschlagen! 
If (RegisterInfo="1") 
MsgBox, 32, OK, Du hast dich erfolgreich registriert. `n`n Benutzername: %RUsername% `n Passwort: %RPassword%`n`n Dein Account wartet nun noch auf die Freischaltung durch einen Administratoren.
If (RegisterInfo="2") 
MsgBox, 16, Error, Der Benutzername %RUsername% ist bereits registriert!
If (RegisterInfo="3") 
MsgBox, 16, Error, Benutzername/Passwort ist falsch! 
return 

UrlDownloadToVar(URL, ByRef Result, UserAgent = "", Proxy = "", ProxyBypass = "") { 
    pFix:=a_isunicode ? "W" : "A" 
    hModule := DllCall("LoadLibrary", "Str", "wininet.dll") 

    AccessType := Proxy != "" ? 3 : 1 
    ;INTERNET_OPEN_TYPE_PRECONFIG                    0   // use registry configuration 
    ;INTERNET_OPEN_TYPE_DIRECT                       1   // direct to net 
    ;INTERNET_OPEN_TYPE_PROXY                        3   // via named proxy 
    ;INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY  4   // prevent using java/script/INS 

    io := DllCall("wininet\InternetOpen" . pFix 
    , "Str", UserAgent ;lpszAgent 
    , "UInt", AccessType 
    , "Str", Proxy 
    , "Str", ProxyBypass 
    , "UInt", 0) ;dwFlags 

    iou := DllCall("wininet\InternetOpenUrl" . pFix 
    , "UInt", io 
    , "Str", url 
    , "Str", "" ;lpszHeaders 
    , "UInt", 0 ;dwHeadersLength 
    , "UInt", 0x80000000 ;dwFlags: INTERNET_FLAG_RELOAD = 0x80000000 // retrieve the original item 
    , "UInt", 0) ;dwContext 

    If (ErrorLevel != 0 or iou = 0) { 
        DllCall("FreeLibrary", "UInt", hModule) 
        return 0 
    } 

    VarSetCapacity(buffer, 10240, 0) 
    VarSetCapacity(BytesRead, 4, 0) 

    Loop 
    { 
        ;http://msdn.microsoft.com/library/en-us/wininet/wininet/internetreadfile.asp 
        irf := DllCall("wininet\InternetReadFile", "UInt", iou, "UInt", &buffer, "UInt", 10240, "UInt", &BytesRead) 
        VarSetCapacity(buffer, -1) ;to update the variable's internally-stored length 

        BytesRead_ = 0 ; reset 
        Loop, 4  ; Build the integer by adding up its bytes. (From ExtractInteger-function) 
            BytesRead_ += *(&BytesRead + A_Index-1) << 8*(A_Index-1) ;Bytes read in this very DllCall 

        ; To ensure all data is retrieved, an application must continue to call the 
        ; InternetReadFile function until the function returns TRUE and the lpdwNumberOfBytesRead parameter equals zero. 
        If (irf = 1 and BytesRead_ = 0) 
            break 
        Else ; append the buffer's contents 
        { 
            a_isunicode ? buffer:=StrGet(&buffer, "CP0") 
            Result .= SubStr(buffer, 1, BytesRead_ * (a_isunicode ? 2 : 1)) 
        } 

        /* optional: retrieve only a part of the file 
        BytesReadTotal += BytesRead_ 
        If (BytesReadTotal >= 30000) ; only read the first x bytes 
        break                      ; (will be a multiple of the buffer size, if the file is not smaller; trim if neccessary) 
        */ 
    }

    DllCall("wininet\InternetCloseHandle",  "UInt", iou) 
    DllCall("wininet\InternetCloseHandle",  "UInt", io) 
    DllCall("FreeLibrary", "UInt", hModule) 
} 
return

sampacc:    
GuiControlGet, SName , , SName 
GuiControlGet, SPassword , , SPassword 
GuiControlGet, SRPassword , , SRPassword 
If (SRPassword<>SPassword) 
{ 
MsgBox,16,Error, Die eingegebenen Passwörter stimmen nicht überein!`n`nPasswort: %SPassword%`nPasswort wdh.: %SRPassword%
return 
} 
else
{
	MsgBox, %SName% %SPassword%
	iniwrite, %SName%,%savepath%\%ininame%,einstellungen,Username
	iniwrite, %SPassword%,%savepath%\%ininame%,einstellungen,Password
	MsgBox, 32, OK, Passwort erfolgreich gespeichert!
	reload
}
return 