function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
  end
  
  script.on_event('clear-computers', function(event)
      global.computers = {}
  end)
  
  script.on_event('print-computers', function(event)
      game.print(dump(global.computers))
  end)