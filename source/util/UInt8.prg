#include "hbclass.ch"

class UInt8 FROM UInt            
public:
    method new(xValor) constructor    
endclass

method new(xValor) class UInt8
    super:new(xValor)
    super:nMascara  := 0xFF
    super:nMaxValue := 0xFF
    super:nMinValue := 0x00
return self

