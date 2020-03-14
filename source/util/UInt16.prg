#include "hbclass.ch"

class UInt16 FROM UInt            
public:
    method new(xValor) constructor
        
endclass

method new(xValor) class UInt16
    super:new(xValor)
    super:nMascara  := 0xFFFF
    super:nMaxValue := 0xFFFF
    super:nMinValue := 0x0000
return self

