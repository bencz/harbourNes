#include "hbclass.ch"

class Ram
private:
    //256 byte pages, 8 pages on internal NES RAM
    data aRam init Array(2048)   // uint8
    
public:
    method read(nAddress)
    method write(nAddress, nData)
endclass

method read(nAddress) class Ram
    nAddress %= 2048
return ::aRam[nAddress]

method write(nAddress, nData) class Ram   
    nAddress %= 2048
    ::aRam[nAddress] := nData
return nil