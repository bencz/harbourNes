#include "hbclass.ch"

class Sprite
public:
    data nY       init nil   // uint8
    data nTileNum init nil   // uint8
    data nAttr    init nil   // uint8
    data nX       init nil   // uint8
    data nId      init nil   // uint8
endclass

class Ppu
private:
    data nPpuctrl          init 0 
    data nPpumask          init 0 
    data nPpustatus        init 0x80 
    data nPpustatusCpy     init 0
    data nOamaddr          init 0 
    data nOamdata          init 0 
    data nPpuscroll        init 0 
    data nPpuReadBuffer    init 0
    data nPpuReadBufferCpy init 0
endclass