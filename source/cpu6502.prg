#include "hbclass.ch"

#define CPU_FLAG_CARRY     0
#define CPU_FLAG_ZERO      1
#define CPU_FLAG_INTERRUPT 2
#define CPU_FLAG_DECIMAL   3
#define CPU_FLAG_BREAK4    4
#define CPU_FLAG_BREAK5    5
#define CPU_FLAG_OVERFLOW  6
#define CPU_FLAG_NEGATIVE  7

class CpuExecutionState 
public:
    data nAccumulator   init nil   // uint8
    data xRegister      init nil   // uint8
    data yRegister      init nil   // uint8
    data programCounter init nil   // uint16
    data stackPointer   init nil   // uint8
    data statusRegister init nil   // uint8
    data nCycle         init nil   // uint32
endclass

class Cpu6202
private:
    data nCycle       init 7

    // Registradores aritimeticos
    data nAccumulator init 0  // uint8
    data xRegister    init 0  // uint8
    data yRegister    init 0  // uint8
    
    // Outros registradores
    data nProgramCounter init 0     // uint16
    data nStackPointer   init 0xFD  // uint8
    data nStatusRegister init 0x24  // uint8
    
    // Dispositivos
    data oRam        init nil
    data oMapper     init nil
    data oPpu        init nil
    data oController init nil
endclass