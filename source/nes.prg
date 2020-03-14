#include "hbclass.ch"
#include "SDL.ch"

class Nes
private:
    data oSdl           init nil
    data oRom           init nil
    data oPpu           init nil
    data oController    init nil
    data oCpu6502       init nil
    data lNesIsRunning  init .F.
    
public:
    method initNesConsole(cRomPath)
    
private:
    method createSdlEvents()
    method nesLoop()
endclass

method initNesConsole(cRomPath) class Nes

    if cRomPath == nil .AND. valtype(cRomPath) != "C"
    endif
    
    ::oRom := Rom():New()
    ::oPpu := Ppu():New()
    ::oController := Controller():New()
    ::oCpu6502 := Cpu6502():New(nil, @::oPpu, @::oController)
    
    ** Inicializa o SDL
    ::oSdl := SDL_Wrapper():New()   
    ::createSdlEvents()
    ::oSdl:createWindow("Teste", 512, 480)
    ::oSdl:createRenderer()
    ::oSdl:createTexture()    
    
    * Inicializa o loop do jogo
    ::nesLoop()
    
return nil

method createSdlEvents() class Nes
    local hEvents   := Hash()
    
    hEvents[SDL_QUIT]    := {|n| Qout("SDL_QUIT    --> " + alltrim(str(n))), ::lNesIsRunning := .F.  }
    hEvents[SDL_KEYDOWN] := {|n| Qout("SDL_KEYDOWN --> " + alltrim(str(n))) }
    hEvents[SDL_KEYUP]   := {|n| Qout("SDL_KEYUP   --> " + alltrim(str(n))) }
    
    * Seta os eventos referentes aos botoes
    ::oSdl:setEvents(hEvents)
return nil

method nesLoop() class Nes    
    ::lNesIsRunning := .T.
    
    while ::lNesIsRunning == .T.
        ::oSdl:pollEvent()
    enddo
return nil