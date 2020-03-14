#include "SDL.ch"

static lPodePara

function start()
    local oSdl := nil
    local hEvents := Hash()
    
    testUInt8()
    
    /*
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
    */
return nil

function testUInt8()
    local uInt8_1  := nil
    local uInt16_1 := nil
    
    uInt8_1  := UInt8():New()
    uInt8_1 := 0xFF
    ? uInt8_1:getValue()
    
    uInt16_1 := UInt16():New()
    uInt16_1 := 0xFFFF
    ? uInt16_1:getValue()
    
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