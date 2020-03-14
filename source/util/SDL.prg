#include "hbclass.ch"
#include "SDL.ch"

#define DC_CALL_CDECL 0x0010 
#define SDL_DLL_NAME "SDL2.dll"

class SDL_Wrapper
private:
    ** Ponteiro da DLL
    DATA pSDL_DLL      INIT NIL
  
    ** Ponteiros das estruturas do SDL
    data pSDL_Window   INIT NIL
    data pSDL_Event    INIT NIL
    data pSDL_Renderer INIT NIL
    data pSDL_Texture  INIT NIL
                               
private:
    ** Variaveis de uso interno da classe
    data hEvents       INIT NIL
  
public:
    method new() constructor
    destructor dtor()
 
public:
    method createWindow(cWindowTitle, nWidth, nHeight) 
    method createRenderer(lHeadlessMode)
    method createTexture()
    method pollEvent()
    
    inline method setEvents(hEvents) 
        ::hEvents := HClone(hEvents)
    endmethod 
    
private:
    method getError()
endclass

********************************************************************************
* CONTRUTOR E DESCONSTRUTOR
********************************************************************************
method new() class SDL_Wrapper
    ::pSDL_DLL := LoadLibrary( SDL_DLL_NAME ) 
    if Empty(::pSDL_DLL) .OR. ::pSDL_DLL == nil
        throw( ErrorNew( "HarbourNes", 0, 0, "Falha ao inicializar a DLL do SDL" ) )
    endif 
return self

procedure dtor() class SDL_Wrapper
    if ::pSDL_Event != nil
        FREE_SDL_EVENT(::pSDL_Event)
    endif

    if ::pSDL_Window != nil
        DllCall(::pSDL_DLL, DC_CALL_CDECL, "SDL_DestroyWindow", ::pSDL_Window) 
    endif
    
    ::pSDL_Event  := nil
    ::pSDL_Window := nil
return

********************************************************************************
* METODOS PUBLICOS
********************************************************************************
method createWindow(cWindowTitle, nWidth, nHeight) class SDL_Wrapper
    ::pSDL_Window := DllCall(::pSDL_DLL, DC_CALL_CDECL, "SDL_CreateWindow", ;
                                 cWindowTitle, ;
                                 SDL_WINDOWPOS_UNDEFINED, ;
                                 SDL_WINDOWPOS_UNDEFINED, ;
                                 nWidth, ;
                                 nHeight, ;
                                 SDL_WINDOW_SHOWN )
                                 
    if ::pSDL_Window == NIL
        throw( ErrorNew( "HarbourNes", 0, 0, "Falha ao inicializar a janela" ) )
    endif                             
return nil

**********
* 
**********
method createRenderer(lHeadlessMode) class SDL_Wrapper
    local nHeadlessMode := nil
    nHeadlessMode := iif(lHeadlessMode == nil .OR. lHeadlessMode == .F., 0, SDL_RENDERER_PRESENTVSYNC)

    ::pSDL_Renderer := DllCall(::pSDL_DLL, DC_CALL_CDECL, "SDL_CreateRenderer", ;
                                 ::pSDL_Window, ;
                                 0, ;
                                 SDL_RENDERER_ACCELERATED | nHeadlessMode )
                                 
    if ::pSDL_Renderer == NIL
        throw( ErrorNew( "HarbourNes", 0, 0, "Falha ao inicializar o sistema de renderizacao" ) )
    endif  
return nil

**********
* 
**********
method createTexture() class SDL_Wrapper
    ::pSDL_Texture := DllCall(::pSDL_DLL, DC_CALL_CDECL, "SDL_CreateTexture", ;
                                 ::pSDL_Renderer, ;
                                 SDL_PIXELFORMAT_ARGB8888, ;
                                 SDL_TEXTUREACCESS_STATIC, ;
                                 256, ;
                                 240 )
                                 
    if ::pSDL_Texture == NIL
        throw( ErrorNew( "HarbourNes", 0, 0, "Falha ao inicializar a textura" ) )
    endif  
return nil

**********
* 
**********
method pollEvent() class SDL_Wrapper
    local nEventType   := nil
    local nEventSymbol := nil

    if ::pSDL_Event == nil
        ::pSDL_Event := MALLOC_SDL_EVENT()
    endif
    
    while DllCall(::pSDL_DLL, DC_CALL_CDECL, "SDL_PollEvent", ::pSDL_Event) == 1
        nEventType   := GET_SDL_EVENT_TYPE(::pSDL_Event)
        nEventSymbol := GET_SDL_EVENT_SYMBOL(::pSDL_Event)
                
        if (::hEvents != nil .AND. Hb_IsHash(::hEvents)) .AND. HHasKey(::hEvents, nEventType)
            Eval(::hEvents[nEventType], nEventSymbol)
        endif
    enddo         
return nil

********************************************************************************
* METODOS PRIVADOS
********************************************************************************
method getError() class SDL_Wrapper
    local cResult := nil
    cResult := DllCall(::pSDL_DLL, DC_CALL_CDECL, "SDL_GetError")
return cResult


********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************

/*
 * FOI IMPLEMENTADO ESSAS FUNÇÕES EM C PARA OBTER
 * O TIPO DO EVENTO DO SDL E O CODIGO DO EVENTO ( KEY )
 * É MUITO POSSIVEL MIGRAR ESSE CÓDIGO PARA O HARBOUR, 
 * BASTA TER "SACO" PARA MIGRAR TODAS AS ESTRUTURAS 
 * DO SDL PARA O HARBOUR
 */
#pragma BEGINDUMP

#include "hbapi.h"    
#include "SDL.h"   

#define BUFSIZE 1024

HB_FUNC ( MALLOC_SDL_EVENT )
{
    SDL_Event* event = (SDL_Event*)malloc(sizeof(SDL_Event));
    hb_retptr(event);
}

HB_FUNC ( FREE_SDL_EVENT )
{
    void* event = (void*)hb_parptr(1);
    if(event != NULL)
        free(event);
}

HB_FUNC ( GET_SDL_EVENT_TYPE )
{
    SDL_Event* event = (SDL_Event*)(hb_parptr(1));
    hb_retni(event->type);
}

HB_FUNC( GET_SDL_EVENT_SYMBOL )
{
   SDL_Event* event = (SDL_Event*)(hb_parptr(1));
   hb_retni(event->key.keysym.sym);
}

#pragma ENDDUMP