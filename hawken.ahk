; hawken.ahk

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

Menu, TRAY, Icon, Hawken2.ico
Menu, TRAY, Tip, Hawken Keybindings

text_chat_mode := False

SetTitleMatchMode, 1
; #IfWinActive ahk_class LaunchUnrealUWindowsClient
#IfWinActive Hawken

; Use y or t to engage text chat
; Use shift-enter to stay in text chat mode, such as in the main menu chat boxes

~Enter::
~Esc::
text_chat_mode := False
Return

~+Enter::
~BackSpace::
~T::
~Y::
text_chat_mode := True
Return


; bind q as dodge left

*q::
if text_chat_mode {
  Send {Blind}{q}
  return
}
Send {Blind}{w Up}
if GetKeyState("W", "P")
  Sleep, 50
Send {Blind}{a Down}
Send {Blind}{LShift Down}

KeyWait, q

if GetKeyState("W", "P")
  Send {Blind}{w Down}
if not GetKeyState("A", "P")
  Send {Blind}{a Up}
if not (GetKeyState("LShift", "P") or GetKeyState("e", "P"))
  Send {Blind}{LShift Up}
return

; bind e as dodge right

*e::
if text_chat_mode {
  Send {Blind}{e}
  return
}
Send {Blind}{w Up}
if GetKeyState("W", "P")
  Sleep, 50
Send {Blind}{d Down}
Send {Blind}{LShift Down}

KeyWait, e

if GetKeyState("W", "P")
  Send {Blind}{w Down}
if not GetKeyState("D", "P")
  Send {Blind}{d Up}
if not (GetKeyState("LShift", "P") or GetKeyState("q", "P"))
  Send {Blind}{LShift Up}
return

; bind x as 180 spin

*x::
if text_chat_mode {
  Send {Blind}{x}
  return
}
Send {Blind}{w Up}
Send {Blind}{s Down}
Send {Blind}{LShift Down}

KeyWait, x

if GetKeyState("W", "P")
  Send {Blind}{w Down}
Send {Blind}{s Up}
if not GetKeyState("LShift", "P")
  Send {Blind}{LShift Up}
return

; don't allow shift + back to spin

*s::
if text_chat_mode {
  Send {Blind}{s}
  return
}
if (GetKeyState("Q", "P") or GetKeyState("E", "P") or GetKeyState("LShift", "P")) {
  Send {Blind}{LShift Up}
  sleep, 10
}
Send {Blind}{s Down}

KeyWait, s

Send {Blind}{s Up}
if (GetKeyState("Q", "P") or GetKeyState("E", "P") or GetKeyState("LShift", "P"))
  Send {Blind}{LShift Down}
return

*LShift::
if text_chat_mode {
  Send {LShift Down}
  return
}
if GetKeyState("S", "P"){
  return
}
Send {Blind}{LShift Down}
return

*LShift Up::

Send {Blind}{LShift Up}
return

#IfWinActive
