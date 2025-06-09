#Requires AutoHotkey v2.0
#SingleInstance Force

; Mac-Style Keyboard Remapping for Windows
; Made with love by Adish

*LAlt::
{
    if GetKeyState("Tab", "P") or GetKeyState("Space", "P")
        return
}

*RAlt::
{
    if GetKeyState("Tab", "P") or GetKeyState("Space", "P")
        return
}

; Alt → Ctrl mapping
LAlt & a::Send("^a")  ; Select All
RAlt & a::Send("^a")

LAlt & c::Send("^c")  ; Copy
RAlt & c::Send("^c")

LAlt & v::Send("^v")  ; Paste
RAlt & v::Send("^v")

LAlt & x::Send("^x")  ; Cut
RAlt & x::Send("^x")

LAlt & z::Send("^z")  ; Undo
RAlt & z::Send("^z")

LAlt & y::Send("^y")  ; Redo
RAlt & y::Send("^y")

LAlt & s::Send("^s")  ; Save
RAlt & s::Send("^s")

LAlt & o::Send("^o")  ; Open
RAlt & o::Send("^o")

LAlt & n::Send("^n")  ; New
RAlt & n::Send("^n")

LAlt & f::Send("^f")  ; Find
RAlt & f::Send("^f")

LAlt & p::Send("^p")  ; Print
RAlt & p::Send("^p")

LAlt & w::Send("^w")  ; Close Tab/Window
RAlt & w::Send("^w")

; Alt+T → Ctrl+T (New Tab) / Alt+Shift+T → Ctrl+Shift+T (Reopen)
LAlt & t::
{
    if GetKeyState("Shift", "P")
        Send("^+t")
    else
        Send("^t")
}
RAlt & t::
{
    if GetKeyState("Shift", "P")
        Send("^+t")
    else
        Send("^t")
}

LAlt & r::Send("^r")  ; Refresh
RAlt & r::Send("^r")

LAlt & l::Send("^l")  ; Address Bar
RAlt & l::Send("^l")

LAlt & q::Send("!{F4}")  ; Quit
RAlt & q::Send("!{F4}")

; --- NAVIGATION SECTION ---
LAlt & Down::Send("{Enter}")  ; Enter folder
RAlt & Down::Send("{Enter}")

; --- NEWLY ADDED HOTKEY START ---
; Alt+Enter → Ctrl+Enter (e.g., submit form, open link in new tab)
; NOTE: This overrides the default Windows behavior of Alt+Enter, which is often
; used to open the Properties window or toggle full-screen mode.
LAlt & Enter::Send("^{Enter}")
RAlt & Enter::Send("^{Enter}")
; --- NEWLY ADDED HOTKEY END ---

LAlt & `::Send("!{Esc}")  ; Switch between windows of same app
RAlt & `::Send("!{Esc}")

; Ctrl → Alt mapping for menu access
LCtrl & f::Send("!f")  ; File menu
RCtrl & f::Send("!f")

LCtrl & e::Send("!e")  ; Edit menu
RCtrl & e::Send("!e")

; Testing menu
A_TrayMenu.Add("Test Alt+Tab", TestAltTab)
A_TrayMenu.Add("Test Copy/Paste", TestCopyPaste)
A_TrayMenu.Add("Test PowerToys Run", TestPowerToysRun)
A_TrayMenu.Add("Test Reverse Tab", TestReverseTab)
A_TrayMenu.Add("Test Reopen Tab", TestReopenTab)
A_TrayMenu.Add("Test Ctrl+Enter", TestCtrlEnter) ; Added new test

TestAltTab(*) {
    MsgBox("Press Alt+Tab. It should work like native Windows.")
}
TestCopyPaste(*) {
    MsgBox("Select text and press Alt+C to copy, then Alt+V to paste.")
}
TestPowerToysRun(*) {
    MsgBox("Press Alt+Space. PowerToys Run should appear.")
}
TestReverseTab(*) {
    MsgBox("Open a browser with multiple tabs. Press Ctrl+Shift+Tab to cycle backwards.")
}
TestReopenTab(*) {
    MsgBox("In a browser, close a tab. Now press Alt+Shift+T. The closed tab should reopen.")
}
TestCtrlEnter(*) {
    MsgBox("Pressing Alt+Enter now sends Ctrl+Enter.`n`n" .
           "Try it on a Google search result to open it in a new tab, or in a web form to submit it.`n`n" .
           "Note: This replaces the standard Windows shortcut for Properties/Full-Screen.")
}
