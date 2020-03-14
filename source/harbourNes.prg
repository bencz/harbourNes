
function start()
    local oNes := nil
    
    oNes := Nes():New()
    oNes:initNesConsole("mario.nes")
    oNes:gameLoop()
    
return nil

