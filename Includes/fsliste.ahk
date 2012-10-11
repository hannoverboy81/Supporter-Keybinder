:?:/fhilfe::
Suspend Permit
SendInput, {Enter}
ShowDialog(0, ">>Freundesliste Hilfe<<", "Folgende Befehle f�r die Freundesliste sind vorhanden`n`n/flist Zeigt euch die Freundesliste`n/fadd F�gt einen Freund anhand des Namens hinzu `n/fidadd F�gt einen Freund anhand der ID hinzu`n/fdel l�scht einen Freund anhand des Names`n/fiddel L�scht einen Freund anhand der ID", "OK")
Suspend Off
Hotkey, t, on
return

:?:/flist::
Suspend Permit
GetPlayerData()
SendInput, {Enter}
Sleep, 250
VarSetCapacity(final, 256, 0)
Loop, read, %savepath%\Freunde.ini
{
    StringSplit, OutputArr, A_LoopReadLine, =
    id := GetPlayerIdByName(OutputArr1)
    if( A_LoopReadLine != "[Freunde]") {
		if(id == -1)
		{
			final = %final%->{FF0000}Offline`t{FFFFFF}%OutputArr1%`n
		}
		else
		{
            if(id == 0)
              id := GetPlayerIdByName(OutputArr1)
			score := GetPlayerScoreByName(OutputArr1)
			if(Score == 0)
				score := GetPlayerScoreByName(OutputArr1)
			Score := feldl�nge(score,3)
			id := feldl�nge(id,3)
			OutputArr1 := feldl�nge(OutputArr1,24)
			final = %final%->{00FF00}Online`t{FFFFFF}%OutputArr1%
			if(strlen(OutputArr2) != 0)
			{
				OutputArr2 := feldl�nge(OutputArr2,5)
				final = %final%`tTel.: %OutputArr2%`tLevel: %score%`tID: %id%`n
			}
			else
			{
				final = %final%`tLevel: %score%`tID: %id%`n
			}
			final = %final%
		}
	}
}
if(final == "")
	Final := "Du hast keine Freunde eingetragen!"
Sort, Final
ShowDialog(1, "Freundesliste", final, "Verlassen")
Suspend Off
Hotkey, t, on
return

:?:/fadd::
Suspend Permit
AddChatMessage(0xFFFFFF, "Gebe bitte den Namen ein")
sleep 300
SendInput {Enter}
SendInput t{Space}
Suspend On
Hotkey, Enter, On
Input, NeuerFreund, V I M T10,{Enter}
Keywait, Enter, D, T20
If errorlevel
{
	AddChatMessage(0xFFFFFF, "Fehler, du hast zu lange gebraucht.")
} 
else
{
	AddChatMessage(0xFFFFFF, "Gebe bitte die Handynummer ein")
	SendChat("/number " NeuerFreund "")
	Suspend On
	Sleep 300
	SendInput t{Space}
	Input, NeueNummer, V I M ,{Enter}
	Keywait, Enter, D, T20
	If ErrorLevel
	{
		AddChatMessage(0xFFFFFF, "Fehler, du hast zu lange gebraucht.")
	}
	else
	{
		IniWrite, %NeueNummer%, %savepath%\Freunde.ini, Freunde, %NeuerFreund%
		return
	}
	Suspend Off
	Hotkey, t, on
}
return

:?:/fidadd::
Suspend Permit
GetPlayerData()
AddChatMessage(0xFFFFFF, "Gebe bitte die ID ein")
sleep 300
SendInput {Enter}
SendInput t{Space}
Suspend On
Hotkey, Enter, On
Input, NeuerFreundID, V I M T10,{Enter}
Keywait, Enter, D, T20
If errorlevel
{
	AddChatMessage(0xFFFFFF, "Fehler, du hast zu lange gebraucht.")
} 
else
{
	AddChatMessage(0xFFFFFF, "Gebe bitte Handynummer ein")
	Suspend, On
	Sleep, 300
	SendInput, t{Space}
	Input, NeueNummer, V I M ,{Enter}
	Keywait, Enter, D, T20
	If ErrorLevel
	{
		AddChatMessage(0xFFFFFF, "Fehler, du hast zu lange gebraucht.")
	}
	else
	{
		GetPlayerNameById(NeuerFreundID, NeuerFreund)
		IniWrite, %NeueNummer%, %savepath%\Freunde.ini, Freunde, %NeuerFreund%
		return
	}
	Suspend Off
	Hotkey, t, on
}
return


:?:/fdel::
Suspend Permit
AddChatMessage(0xFFFFFF, "Gebe bitte den Namen ein")
sleep, 300
SendInput {Enter}
SendInput t{Space}
Suspend On
Hotkey, Enter, On
Input, NeuerFreund, V I M T10,{Enter}
Keywait, Enter, D, T20
If errorlevel
{
	AddChatMessage(0xFFFFFF, "Fehler, du hast zu lange gebraucht.")
} 
else
{
	IniDelete, %savepath%\Freunde.ini, Freunde, %NeuerFreund%
}
Suspend Off
Hotkey, t, on
return

:?:/fiddel::
Suspend Permit
GetPlayerData()
AddChatMessage(0xFFFFFF, "Bitte gebe die ID des jeweiligen Spielers ein!")
sleep 300
SendInput {Enter}
SendInput t{Space}
Suspend On
Hotkey, Enter, On
Input, FreundwegID, V I M T10,{Enter}
Keywait, Enter, D, T20
If errorlevel
{
	AddChatMessage(0xFFFFFF, "Fehler, du hast zu lange gebraucht.")
} 
else
{
	GetPlayerNameById(FreundwegID, NeuerFreund)
	IniDelete, %savepath%\Freunde.ini, Freunde, %NeuerFreund%
}
Suspend Off
Hotkey, t, on
return

feldl�nge(str, l�nge = 15, zeichen = " ")
{
  l := l�nge - StrLen(SubStr(str, 1, l�nge))
    Loop, %l%
      ID := ID zeichen
    Result := SubStr(str, 1, l�nge) ID
    Return Result
}