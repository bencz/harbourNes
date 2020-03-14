#include "hbclass.ch"
#include "SDL.ch"

class Controller
private:
    data nJoy1           init 0
    data nJoy2           init 0
    data nBtnStateLocked init 0
    data nBtnState       init 0
    data lStrobe         init .F.
    
public:
    // Bus
    method read(nAddress)
    method write(nAddress, nData)
    
    // Input
    method setButtonPressed(nKeyCode, lPressed)
endclass

method read(nAddress) class Controller
return nil

method write(nAddress, nData) class Controller
return nil

method setButtonPressed(nKeyCode, lPressed) class Controller
    local nShiftDeslocation := nil
    
    if     nKeyCode == SDLK_a       ; nShiftDeslocation := 0
    elseif nKeyCode == SDLK_b       ; nShiftDeslocation := 1
    elseif nKeyCode == SDLK_SPACE   ; nShiftDeslocation := 2
    elseif nKeyCode == SDLK_RETURN  ; nShiftDeslocation := 3
    elseif nKeyCode == SDLK_UP      ; nShiftDeslocation := 4
    elseif nKeyCode == SDLK_DOWN    ; nShiftDeslocation := 5
    elseif nKeyCode == SDLK_LEFT    ; nShiftDeslocation := 6
    elseif nKeyCode == SDLK_RIGHT   ; nShiftDeslocation := 7
    endif 
    
    if nShiftDeslocation != nil   
        ::nBtnState := iif(lPressed, nBtnState | ( 1 << nShiftDeslocation ), ( nBtnState & hb_BitNot( 1 << nShiftDeslocation ))) 
    endif
return nil