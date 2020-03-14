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

class Cpu6502
private:
    data nCycle       init 7

    // Registradores aritimeticos
    data nAccumulator init 0  // uint8
    data xRegister    init 0  // uint8
    data yRegister    init 0  // uint8
    
    // Opcodes
    data hOpcodes     init nil
    
    // Outros registradores
    data nProgramCounter init 0     // uint16
    data nStackPointer   init 0xFD  // uint8
    data nStatusRegister init 0x24  // uint8
    
    // Dispositivos
    data oRam        init nil
    data oMapper     init nil
    data oPpu        init nil
    data oController init nil
    
public:
    inline method new(oMapper, oPpu, oController)
        ::oMapper     := oMapper
        ::oPpu        := oPpu
        ::oController := oController
        
        ::initOpcodeTable()
        
        return self
    endmethod
    
private:
    method initOpcodeTable()
    
private:
    inline method immediate
        return ++::nProgramCounter
    endmethod
endclass

method initOpcodeTable() class Cpu6502
    if ::hOpcodes == nil
        ::hOpcodes := Hash()
    endif

    // ADC
    ::hOpcodes[0x69] := {|| ::ADC(HB_ObjMsgPtr(self, "immediate")) }
    ::hOpcodes[0x65] := {|| ::ADC(HB_ObjMsgPtr(self, "zeroPage")) }
    ::hOpcodes[0x75] := {|| ::ADC(HB_ObjMsgPtr(self, "zeroPageX")) }
    ::hOpcodes[0x6D] := {|| ::ADC(HB_ObjMsgPtr(self, "absolute")) }
    ::hOpcodes[0x7D] := {|| ::ADC(HB_ObjMsgPtr(self, "absoluteX", /*extraTick*/ .T.)) }
    ::hOpcodes[0x79] := {|| ::ADC(HB_ObjMsgPtr(self, "absoluteY", /*extraTick*/ .T.)) }
    ::hOpcodes[0x61] := {|| ::ADC(HB_ObjMsgPtr(self, "indirectX")) }
    ::hOpcodes[0x71] := {|| ::ADC(HB_ObjMsgPtr(self, "indirectY", /*extraTick*/ .T.)) }
    
    // ASL
    ::hOpcodes[0x1E] := {|| ::ASL(HB_ObjMsgPtr(self, "absoluteX"), /* lExtraTick */ .F. ), ::tick() }
return nil 

