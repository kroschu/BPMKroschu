; Autogenerated with DRAKON Editor 1.23
; AutoHotkey_L beta v1.7 code generator used


;Header starts here.
ForLoopTest(2)
return ;This "return" is here to prevent unintended execution of code.
;Header ends here.


return ;This "return" is here to prevent unintended execution of code.
ForLoopTest(a) {
    ; item 60001
    i := 1
    Loop, {
        ; item 60002
        if (i <= 3) {
            
        } else {
            break
        }
        ; item 9
        a := a * a
        ; item 60003
        i := i + 1
    }
    ; item 8
    msgbox, %a%
    return
}


