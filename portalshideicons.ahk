#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon

Timer := 0
Iconmove := 0

SetTimer, Timed, 100


Loop
{
	if (DestopActive > 1 and Timer > 0 and Timer < 62)
	{
		if (!GetKeyState("LButton","P") and Timer > 0 and Timer < 22)
		{
			if (Timer = 1)
				Timer := 20
			Timer += 1
			Click := 1
		}
		if (Click = 1 and GetKeyState("LButton","P") and Timer > 1 and Timer < 22)
		{
			Timer += 20
			Click += 1
		}
		if (Click = 2 and !GetKeyState("LButton","P") and Timer > 21 and Timer < 42)
		{
			Timer += 20
			Click += 1
		} 
		if (Click = 3 and Timer > 21 and Timer < 42)
		{
			Timer := 21
			Click := 1
		}
		if (Click = 3 and GetKeyState("LButton","P") and Timer > 41 and Timer < 62)
		{
			Timer += 20
			Click := 1
		}
	}
	sleep 10
}


Timed:

if (Iconmove < 30)
	Iconmove += 1
else
{
	Iconmove := 0
	Loop, Files, %A_Desktop%\*.lnk
		FileMove, %A_LoopFileFullPath%, %A_Desktop%\..\Portals\Default\%A_LoopFileName%, 1
	Loop, Files, %A_DesktopCommon%\*.lnk
		FileMove, %A_LoopFileFullPath%, %A_Desktop%\..\Portals\Default\%A_LoopFileName%, 1
}


DestopActive := 0
if (WinActive("ahk_exe Nexus.exe"))
DestopActive := 1
if (WinActive("ahk_class NotifyIconOverflowWindow"))
DestopActive := 1
if (WinActive(A_MyDocuments . "\Rainmeter\Skins\Droptop\DropdownBar\DropdownBar.ini ahk_exe Rainmeter.exe"))
DestopActive := 1
if (WinActive("ahk_class WorkerW"))
DestopActive := 2
if (WinActive("ahk_class Progman"))
DestopActive := 2
if (WinActive("ahk_exe Portals.exe",,"Portals"))
DestopActive := 3



if (DestopActive > 0)
{
	if (Timer > 0 and Timer < 62)
		Timer -= 1
	if (DestopActive > 1 and Timer < 1)
		Timer := 1
	if (Timer = 83)
		Timer := 84
	if (Timer > 61 and Timer < 83)
		Timer := 83
		
}
else
{
	if (Timer > 0)
		Timer := 0
	if (Timer > -11)
		Timer -= 1
	
}

if (Timer = 83 or Timer = -10)
{

	WinGet, pidlist, List, ahk_exe Portals.exe,, Portals
	loop %pidlist%
	{
	
		Element := pidlist%A_Index%
		
		if (Timer = 83)
		{
			X := X%Element%
			Y := Y%Element%
			if (X = "" or Y = "")
			{
				WinGetPos, X, Y,,, ahk_id %Element%
				if (X < -10000)
					X += 15000
				X%Element% := X
				Y%Element% := Y
			}
			WinMove, ahk_id %Element%,, %X%, %Y%
		}	
		else if (Timer = -10)
		{
		
			X := X%Element%
			Y := Y%Element%
			if (X = "" or Y = "")
			{
				WinGetPos, X, Y,,, ahk_id %Element%
				if (X < -10000)
					X += 15000
				X%Element% := X
				Y%Element% := Y
			}
			WinMove, ahk_id %Element%,, X-15000, Y
		}
	}
}
return