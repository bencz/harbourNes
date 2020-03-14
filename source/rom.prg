#include "hbclass.ch"

***********
* https://wiki.nesdev.com/w/index.php/INES
***********
class INESHeader
public:
    data aNes         init Array(4)   // char
    data nPrgIn16kb   init nil        // uint8
    data nChrIn8kb    init nil        // uint8
    data nFlags6      init nil        // uint8
    data nFlags7      init nil        // uint8
    data nPrgRamIn8kb init nil        // uint8
    data nFlags9      init nil        // uint8
    data nFlags10     init nil        // uint8
    data aZeros       init Array(5)   // char
endclass

class Rom
private:
    data oINESHeader init nil
endclass