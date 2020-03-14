#include "SDL.ch"

static lPodePara

function start()
    local oSdl := nil
    local hEvents := Hash()
    
    lPodePara := .F.
    
    hEvents[SDL_QUIT]    := {|n| testeQuit(n) }
    hEvents[SDL_KEYDOWN] := {|n| testeKeyDown(n) }
    hEvents[SDL_KEYUP]   := {|n| testeKeyUp(n) }
    
    oSdl := SDL_Wrapper():New()
    oSdl:setEvents(hEvents)
    
    oSdl:createWindow("Teste", 512, 480)
    oSdl:createRenderer()
    oSdl:createTexture()
    
    while lPodePara == .F.
        oSdl:pollEvent()
    enddo

return nil

function testeQuit(nTeste)
    ? "testeQuit" + cstr(nTeste)
    lPodePara := .t.
return nil

function testeKeyDown(nTeste)
    ? "testeKeyDown" + cstr(nTeste)
return nil

function testeKeyUp(nTeste) 
    ? "testeKeyDown" + cstr(nTeste)
return nil