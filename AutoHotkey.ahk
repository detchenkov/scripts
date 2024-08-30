#SingleInstance force
; The most common modifiers are Ctrl (^), Alt (!), Shift (+) and Win (#)
; Parameters
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.
SetCapsLockState "Off"
ru := DllCall("LoadKeyboardLayout", "Str", "a0000419", "Int", 1)
en := DllCall("LoadKeyboardLayout", "Str", "00000409", "Int", 1)
fr := DllCall("LoadKeyboardLayout", "Str", "0000040c", "Int", 1)

; Scripts
; ssf -> select * from
::ssf::
{
	SendInput("select top 50 * from{Space}")
}

; #e::
; {
; 	run("explorer.exe C:\Users\detch")
; }

;Run obsidian
^!o::
{
	run("obsidian://open")
}

;New note in obsidian
^!n::
{
	run("obsidian://new")
}

;To run terminal preview
^!t::
{
	run ("wt -w _quake")
}

;To insert date
^!d::
{
	CurrentDateTime := FormatTime(,"dd/MM/yyyy")
	SendInput(CurrentDateTime)
}

;Caps
$CapsLock:: ;When I press CapsLock
{
	timedOut := KeyWait("CapsLock", "T0.5") ;Wait 0.5 seconds for CapsLock to be released
	If timedOut == 0 ;If Capslock wasn't release within 0.5 second
	{
	    if GetKeyState("CapsLock", "T") = 0
	    	SetCapsLockState "On"
	    else
	    	SetCapsLockState "Off"
	    Keywait "CapsLock" ; indefinitely wait for the release
	}
	else
	{
		w := DllCall("GetForegroundWindow")
		if WinActive("ahk_class ConsoleWindowClass")
		{
			IMEWnd	:= DllCall("Imm32.dll\ImmGetDefaultIMEWnd", "Ptr", w)
			if (IMEWnd == 0)
			{
			  Return
			}
			else
			{
			  w := IMEWnd
			}
		}
		else if WinActive("ahk_class vguiPopupWindow") or WinActive("ahk_class ApplicationFrameWindow")
		{
			Focused	:= ControlGetFocus("A")
			if (Focused == 0)
			{
				Return
			}
			else
			{
				CtrlID	:= ControlGetHwnd(Focused, "A")
				w 	:= CtrlID
			}
		}
		pid := DllCall("GetWindowThreadProcessId", "UInt", w, "Ptr", 0)
		l := DllCall("GetKeyboardLayout", "UInt", pid)
		if (l != ru)
		{
			PostMessage 0x50, 0, ru,, "A"
		}
		else
		{
			PostMessage 0x50, 0, fr,, "A"
		}
	}
}

;Toggle ligth/dark mode
+#d:: ;Win+Shift+D
{
	CurrentTheme := RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme")
	RegWrite 1 - CurrentTheme, "REG_DWORD", "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme"
}

; Unicode Support — Enter 4 symbol UTF8 code
#U::SendUnicode()
SendUnicode()
{
	inHook := InputHook("L4")
	inHook.Start()
	inHook.Wait()
	hex := inHook.Input
  Send "{U+" hex "}"
}

; ---- Windows Maximizing / Restoring
; Win + MouseWheel
#WheelUp:: WinMaximize "A"
#WheelDown:: WinRestore "A"
