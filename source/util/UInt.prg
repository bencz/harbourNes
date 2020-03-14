#include "hbclass.ch"

class UInt
protected:
    data nValor    init 0
    data nMaxValue init 0
    data nMinValue init 0
    data nMascara  init 0
    
public:
    OPERATOR ":=" ARG nValor INLINE self:new(nValor)
    
    ****************************************************************************
    * OPERADORES DE SOMA                                                       *
    ****************************************************************************
    OPERATOR "+"  ARG xValor INLINE self:new(::getValueFromArg(xValor) + ::nValor)
    OPERATOR "++" INLINE ::nValor++, self
    OPERATOR "+=" ARG xValor INLINE ::nValor + ::getValueFromArg(xValor)
    
    ****************************************************************************
    * OPERADORES DE SUBTRACAO                                                  *
    ****************************************************************************
    OPERATOR "-"  ARG xValor INLINE self:new(::getValueFromArg(xValor) - ::nValor)
    OPERATOR "--" INLINE ::nValor--, self
    OPERATOR "-=" ARG xValor INLINE ::nValor - ::getValueFromArg(xValor)
    
    ****************************************************************************
    * OPERADORES DE COMPARACAO                                                 *
    ****************************************************************************
    OPERATOR ">"  ARG xValor INLINE ::nValor >  ::getValueFromArg(xValor)
    OPERATOR ">=" ARG xValor INLINE ::nValor >= ::getValueFromArg(xValor)
    OPERATOR "<"  ARG xValor INLINE ::nValor <  ::getValueFromArg(xValor)
    OPERATOR "<=" ARG xValor INLINE ::nValor <= ::getValueFromArg(xValor)
    OPERATOR "==" ARG xValor INLINE ::nValor == ::getValueFromArg(xValor)
    OPERATOR "!=" ARG xValor INLINE ::nValor != ::getValueFromArg(xValor)
    OPERATOR "<>" ARG xValor INLINE ::nValor <> ::getValueFromArg(xValor)
    
    ****************************************************************************
    * OPERADORES DE lOGICOS                                                    *
    ****************************************************************************
    /*
    OPERATOR ">>"  ARG xValor INLINE
    OPERATOR ">>=" ARG xValor INLINE
    OPERATOR "<<"  ARG xValor INLINE
    OPERATOR "<<=" ARG xValor INLINE
    OPERATOR "&"   ARG xValor INLINE
    OPERATOR "&="  ARG xValor INLINE
    OPERATOR "|"   ARG xValor INLINE
    OPERATOR "|="  ARG xValor INLINE
    */
    
public:
    inline method getValue()
        return ::nValor & ::nMascara
    endmethod
   
protected:
    method new(xValor) inline ::nValor := ::getValueFromArg(xValor), self
    method getValueFromArg(xValor) 
endclass

method getValueFromArg(xValor) class UInt
    local nValor := 0
    
    if xValor != nil
        if Hb_IsObject(xValor) .and. xValor:className == Left(self:className, 4)
            nValor := xValor:nValor
        elseif HB_ISNUMERIC(xValor)
            nValor := xValor
        endif
    endif
return nValor
