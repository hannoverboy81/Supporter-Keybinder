:?:/act::
	Suspend Permit
IniRead, Aufnahme,%savepath%\%ininame%, Sup, Ticket
GetPlayerData()
GetPlayerNameById(Aufnahme, PlayerName)
	FormatTime, Zeit,%A_Now%,HH
	if (A_Hour > 5)
	{
		if (A_Hour < 12)
		{
			Suspend Permit
			SendInput {enter}
			sleep 1
			SendChat("/po Bei weiteren Fragen, erstelle einfach ein neues Ticket!")
			sleep 100
			SendChat("/po Ich w�nsche ihnen noch einen sch�nen Tag, " PlayerName "!")
			SendChat("/ct")
			PressedT=0
			Suspend Off
			Hotkey, t, On
			return
		}
	}
	if (A_Hour > 11)
	{
		if (A_Hour < 18)
		{
		Suspend Permit
		SendInput {enter}
		sleep 1
		SendChat("/po Bei weiteren Fragen, erstelle einfach ein neues Ticket!")
		sleep 100
		SendChat("/po Ich w�nsche ihnen noch einen sch�nen Tag, " PlayerName "!")
		SendChat("/ct")
		PressedT=0
		Suspend Off
		Hotkey, t, On
		return
		}
	}
	if (A_Hour > 17)
	{
		if (A_Hour < 22)
		{
			Suspend Permit
			SendInput {enter}
			sleep 10
			SendChat("/po Bei weiteren Fragen, erstelle einfach ein neues Ticket!")
			sleep 100
			SendChat("/po Ich w�nsche ihnen noch einen sch�nen Abend, " PlayerName "!")
			SendChat("/ct")
			PressedT=0
			Suspend Off
			Hotkey, t, On
			return
		}
	}
	if (A_Hour > 21)
	{
		if (A_Hour < 25)
		{
			Suspend Permit
			SendInput {enter}
			sleep 1
			SendChat("/po Bei weiteren Fragen, erstelle einfach ein neues Ticket!")
						sleep 100
			SendChat("/po Ich w�nsche ihnen noch einen sch�nen Abend, " PlayerName "!")
			SendChat("/ct")
			PressedT=0
			Suspend Off
			Hotkey, t, On
			return
		}
	}
	if(A_Hour=0)
	{
		Suspend Permit
		SendInput {enter}
		sleep 1
		SendChat("/po Bei weiteren Fragen, erstelle einfach ein neues Ticket!")
		sleep 100
		SendChat("/po Ich w�nsche ihnen noch eine sch�ne Nacht, " PlayerName "!")
		SendChat("/ct")
		PressedT=0
		Suspend Off
		Hotkey, t, On
		return
	}
	if (A_Hour > 0)
	{
		if (A_Hour < 6)
		{
			Suspend Permit
			SendInput {enter}
			sleep 1
			SendChat("/po Bei weiteren Fragen, erstelle einfach ein neues Ticket!")
			sleep 100
			SendChat("/po Ich w�nsche ihnen noch eine sch�ne Nacht, " PlayerName "!")
			SendChat("/ct")
			PressedT=0
			Suspend Off
			Hotkey, t, On
			return
		}
	}
	else
	{
		Suspend Permit
		SendInput {enter}
		sleep 1
		SendChat("/po Bei weiteren Fragen, erstelle einfach ein neues Ticket!")
		SendChat("/ct")
		PressedT=0
		Suspend Off
		Hotkey, t, On
		return
	}
return


:?:/ot::
Suspend Permit
FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\Chatlog.txt
hotkey, enter, off
sendinput /ot{space}
input, Aufnahme, V I M,{enter}
sleep 100
Iniwrite, %Aufnahme% , %savepath%\%ininame%, Sup, Ticket
sleep 100
IniRead, Aufnahme,%savepath%\%ininame%, Sup, Ticket
GetPlayerData()
GetPlayerNameById(Aufnahme, PlayerName)
sleep 100
PlayerScore := GetPlayerScoreById(Aufnahme)
Suspend Off
Hotkey, t, On
sleep 100
	Loop, read, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	{
	If InStr(A_LoopReadLine, "Das Ticket des Spielers wird bereits")
{
	{
		RegExMatch(A_LoopReadLine, "Das Ticket des Spielers wird bereits von (.*)" ,supporter)
	}
	sleep 100
	AddChatMessage(0xFFFFFF, "Das Support Ticket wird bereits von " supporter1 "")
	return
}
		{
	If InStr(A_LoopReadLine, "Dieser Spieler ist Offline")
{
	sleep 100
	AddChatMessage(0xFFFFFF, "Der Ersteller des Support Tickets scheint nicht mehr Online zu sein.")
}
	return
}
}
Gosub, OpenTicket
return

OpenTicket:
if (A_Hour > 5)
	{
		if (A_Hour < 12)
		{
			sleep 1
			SendChat("/po Hallo " PlayerName ", Sch�nen Guten Morgen.")
			sleep 100
			SendChat("/po Wie kann ich Ihnen Behilflich sein?")
			PressedT=6
			
			return
		}
	}
	if (A_Hour > 11)
	{
		if (A_Hour < 18)
		{
			sleep 1
			SendChat("/po Hallo " PlayerName ", Guten Tag.")
			sleep 100
			SendChat("/po Wie kann ich Ihnen Behilflich sein?")
			PressedT=6
			if(Startbonus=1)
			
			return
		}
	}
	if (A_Hour > 17)
	{
		if (A_Hour < 22)
		{
			sleep 1
			SendChat("/po Hallo " PlayerName ", Guten Abend.")
			sleep 100
			SendChat("/po Wie kann ich Ihnen Behilflich sein?")
			PressedT=6
			if(Startbonus=1)
			
			return
		}
	}
	if (A_Hour > 21)
	{
		if (A_Hour < 25)
		{
			sleep 1
			SendChat("/po Hallo " PlayerName ", Guten Abend / Gute Nacht.")
			sleep 100
			SendChat("/po Wie kann ich Ihnen Behilflich sein?")
			PressedT=6
			if(Startbonus=1)
			
			return
		}
	}
	if(A_Hour=0)
	{
		sleep 1
		SendChat("/po Hallo " PlayerName ", Guten Abend / Gute Nacht.")
		sleep 100
		SendChat("/po Wie kann ich Ihnen Behilflich sein?")
		PressedT=6
		if(Startbonus=1)
		
		return
	}
	if (A_Hour > 0)
	{
		if (A_Hour < 6)
		{
			sleep 1
			SendChat("/po Hallo " PlayerName ", Guten Abend / Gute Nacht.")
			sleep 100
			SendChat("/po Wie kann ich Ihnen Behilflich sein?")
			PressedT=6
			if(Startbonus=1)
			
			return
		}
	}
	else
	{
		sleep 1
		SendChat("/po Hallo " PlayerName ", Wie kann ich Ihnen Behilflich sein?")
		sleep 100
		PressedT=6
		if(Startbonus=1)
		
		return
	}
return

:?:/wf::
Suspend Permit
if (GuiPW = Password1 && Eingeloggt == 1)
{
SendInput {enter}
SendChat("/po Haben Sie weitere Fragen?")
Suspend off
}
else
{
SendChat("/me sollte das Passwort in den Optionen angeben! **")
}
return

!m::
Suspend Permit
if (GuiPW = Password1 && Eingeloggt == 1)
{
if(IsChatOpen() == 0 )
{
SendChat("/tickets")
Suspend off
}
}
else
{
SendChat("/me sollte das Passwort in den Optionen angeben! **")
}
return
