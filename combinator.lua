require("worldgen/crc32")
local mod_gui = require("mod-gui")

local built = {defines.events.on_built_entity, defines.events.on_robot_built_entity}

function check_computer_status()
  if (global.computers ~= nil) then 
    for k, v in pairs(global.computers) do  
      if v.actual.valid and v.actual.active and v.actual.name ~= "simulacrum-port" then
        if v.corresponding and v.corresponding.valid == false then
          if settings.global["simulacrum-show-warnings"].value then
            game.print("[color=red]Simulation port " .. tostring(k) .. " for computer at position [gps=" .. tostring(v.actual.position.x) .. "," .. tostring(v.actual.position.y) .. "] was destroyed.[/color] (Make sure you are in the main simulation to check the map)")
          end
          v.actual.active = false
          v.surface = nil
          v.corresponding = nil
          v.actual.crafting_progress = 0
          game.delete_surface(tostring(k))
          if global.computers[k] then
            global.computers[k]["seed"] = ""
            global.computers[k]["surface"] = nil
            global.computers[k]["corresponding"] = nil
            global.computers[k]["status"] = 0
          end
          return
        end
        if (v.actual.status == defines.entity_status.no_power or v.actual.status == defines.entity_status.low_power or v.actual.status == defines.entity_status.no_ingredients or v.actual.status == defines.entity_status.fluid_ingredient_shortage) then
          if v.status ~= 0 and v.surface then
            global.computers[k]["status"] = global.computers[k]["status"] - 1
            if settings.global["simulacrum-show-warnings"].value then
              game.print("[color=red]Computer " .. tostring(k) .. " at position [gps=" .. tostring(v.actual.position.x) .. "," .. tostring(v.actual.position.y) .. "] is going to reset in 2 minutes![/color] (Make sure you are in the main simulation to check the map)")
            end
          
          else
            if settings.global["simulacrum-show-warnings"].value then
              game.print("[color=red]Computer " .. tostring(k) .. " at position [gps=" .. tostring(v.actual.position.x) .. "," .. tostring(v.actual.position.y) .. "] was reset.[/color] (Make sure you are in the main simulation to check the map)")
            end
            v.actual.active = false
            v.surface = nil
            v.corresponding = nil
            v.actual.crafting_progress = 0
            if v.actual.valid and v.actual.name == "one-time-pad" then
              v.actual.die()
            end
            if global.computers[k] then
            local port = global.computers[k].corresponding
              if port and port.valid then
                  global.computers[port.unit_number] = nil
              end
            end
            game.delete_surface(tostring(k))
            if global.computers[k] then
              global.computers[k]["seed"] = ""
              global.computers[k]["surface"] = nil
              global.computers[k]["corresponding"] = nil
            end
          end
        end
      end
    end 
  end
end

function destroy_gui(index)
  local player = game.get_player(index)

  local gui = player.gui.top
  local flow = gui.mod_gui_button_flow or (gui.mod_gui_top_frame and gui.mod_gui_top_frame.mod_gui_inner_frame)

  if flow and flow.teleport_button then
    flow.teleport_button.destroy()
    
    if #flow.children_names == 0 then
      local parent = flow.parent
      flow.destroy()
      if parent and #parent.children_names == 0 then
        parent.destroy()
      end
    end
  end
end

function create_gui(index)
  destroy_gui(index)
  local player = game.get_player(index)

  mod_gui.get_button_flow(player).add{
    type = "sprite-button",
    name = "teleport_button",
    tooltip = {"strings.teleport"},
    sprite = "teleport-button",
    style = "mod_gui_button"
  }
end

local function check_port(event)
  local player = game.get_player(event.player_index)

  if event.prototype_name == "teleport" then
    local entities = player.surface.find_entities_filtered{area={{player.position.x-1,player.position.y-1},{player.position.x+1,player.position.y+1}}, name={"one-time-pad", "simulacrum-port", "simulacrum-computer-1", "simulacrum-computer-2", "simulacrum-computer-3", "simulacrum-computer-4"}, force=player.force}
    if next(entities) == nil then return end
    local vectors = {}
    for _, entity in pairs(entities) do
      vectors[entity.unit_number] = {["x"] = player.position.x - entity.position.x, ["y"] = player.position.y - entity.position.y, ["l"] = math.sqrt((player.position.x - entity.position.x) * (player.position.x - entity.position.x) + (player.position.y - entity.position.y) * (player.position.y - entity.position.y))}
    end
    if next(vectors) == nil then return end

    local min = {}
    local a = nil
    min.x = 10
    min.y = 10
    min.l = 10
    for unit, v in pairs(vectors) do
      if v.l == min.l then
        if v.x < min.x then 
          min = v
          a = unit
        else
          if v.y < min.y then 
            min = v
            a = unit
          end
        end
      end
      if v.l < min.l then
        min = v
        a = unit
      end
    end
  
    if a and global.computers[a] then
      local computer = global.computers[a]
      if (computer.actual.name ~= "simulacrum-port") and (computer.actual.status == defines.entity_status.no_power or computer.actual.status == defines.entity_status.low_power or computer.actual.status == defines.entity_status.no_ingredients or computer.actual.status == defines.entity_status.fluid_ingredient_shortage) then
        return
      end
      local surface = computer.surface
      if surface then 
        local positionx = computer.corresponding.position.x
        local positiony = computer.corresponding.position.y
        if computer.corresponding.name == "simulacrum-computer-2" then 
          positiony = positiony + 9
        elseif computer.corresponding.name == "one-time-pad" or computer.corresponding.name == "simulacrum-port" then
          positiony = positiony + 1
        else
          positiony = positiony + 3
        end
        player.teleport({positionx, positiony}, surface)
      end
    end
  end
end

local function check_combinator(event)
  local computer = nil
  local player = game.get_player(event.player_index)
  local signals = {}
  
  if event.entity and (event.entity.name == "bit-combinator" or event.entity.name == "byte-combinator") then
    computer = game.surfaces[1].find_entities({{event.entity.position.x, event.entity.position.y - 1}, {event.entity.position.x, event.entity.position.y - 1}})

    if (event.entity.name == "byte-combinator") and (event.entity.get_control_behavior().get_signal(1).signal and event.entity.get_control_behavior().get_signal(2).signal and event.entity.get_control_behavior().get_signal(3).signal and event.entity.get_control_behavior().get_signal(4).signal) then
      signals.signal1 = event.entity.get_control_behavior().get_signal(1).signal.name
      signals.signal2 = event.entity.get_control_behavior().get_signal(2).signal.name
      signals.signal3 = event.entity.get_control_behavior().get_signal(3).signal.name
      signals.signal4 = event.entity.get_control_behavior().get_signal(4).signal.name

    elseif (event.entity.name == "bit-combinator") and (event.entity.get_control_behavior().get_signal(1).signal) then
      signals.signal4 = event.entity.get_control_behavior().get_signal(1).signal.name
      signals.signal1 = "byte-00"
      signals.signal2 = "byte-00"
      signals.signal3 = "byte-00"
    else
      return
    end

    if (computer[1] ~= nil) and (computer[1].valid) and computer[1].operable and (computer[1].name == "simulacrum-computer-1" or computer[1].name == "simulacrum-computer-2" or computer[1].name == "simulacrum-computer-3" or computer[1].name == "simulacrum-computer-4") and (computer[1].active == false) then
  
      if string.match(signals.signal1, "^byte%-%w%w$") and string.match(signals.signal2, "^byte%-%w%w$") and string.match(signals.signal3, "^byte%-%w%w$") and string.match(signals.signal4, "^byte%-%w%w$") then
        signals.signal1 = string.sub(signals.signal1, -2)
        signals.signal2 = string.sub(signals.signal2, -2)
        signals.signal3 = string.sub(signals.signal3, -2)
        signals.signal4 = string.sub(signals.signal4, -2)
      else
        if player and player.connected then
          player.print("Please set all of the signals correctly. Only byte signals are allowed to configure quantum computers.")
          return
        end
      end

      local gen_settings = game.surfaces[1].map_gen_settings
      gen_settings.autoplace_controls = {
        ["data-leak"] = {frequency = 0, size = 0},
        ["bit-ore"] = {frequency = 0, size = 0},
        ["simulation-error-ore"] = {frequency = 0, size = 0},
        ["pointer-ore"] = {frequency = 0, size = 0},
        ["iron-ore"] = {frequency = 1, size = 0.17, richness = 0.05},
        ["copper-ore"] = {frequency = 1, size = 0.17, richness = 0.05},
        ["stone"] = {frequency = 1, size = 0.17, richness = 0.05},
        ["coal"] = {frequency = 1, size = 0.17, richness = 0.05}, 
        ["uranium-ore"] = {frequency = 1, size = 0.17, richness = 0.05},
        ["crude-oil"] = {frequency = 5, size = 0.17, richness = 0.17},
        ["enemy-base"] = {frequency = 3, size = 1}
      }
      gen_settings.starting_area = 0

      if (computer[1].name == "simulacrum-computer-1") then
        gen_settings.width = 300
        gen_settings.height = 300
        computer[1].insert("harddrive-dummy")
        computer[1].energy = 20
      elseif (computer[1].name == "simulacrum-computer-2") then
        gen_settings.width = 600
        gen_settings.height = 600
      elseif (computer[1].name == "simulacrum-computer-3") then
        gen_settings.width = 1000
        gen_settings.height = 1000
      elseif (computer[1].name == "simulacrum-computer-4") then
        gen_settings.width = 900 + player.force.technologies["computer-5-zone"].level * 200 
        gen_settings.height = 900 + player.force.technologies["computer-5-zone"].level * 200
        computer[1].insert("harddrive-dummy")
        computer[1].energy = 20
      end

      if global.computers[computer[1].unit_number] then
        global.computers[computer[1].unit_number]["seed"] = signals.signal1 .. signals.signal2 .. signals.signal3 .. signals.signal4
        gen_settings.seed = tonumber(signals.signal1 .. signals.signal2 .. signals.signal3 .. signals.signal4, 16)

        local new_surface = game.create_surface(tostring(computer[1].unit_number), gen_settings)
        -- new_surface.request_to_generate_chunks({0, 0}, 1)
        local corresponding = new_surface.create_entity{name = "simulacrum-port", position = {0, 0}, force = "player", raise_built = true}
        corresponding.operable = false
        corresponding.minable = false
        global.computers[computer[1].unit_number]["corresponding"] = corresponding
        global.computers[corresponding.unit_number]["corresponding"] = computer[1]
        global.computers[computer[1].unit_number]["surface"] = new_surface.name
        global.computers[computer[1].unit_number]["status"] = 1
        computer[1].active = true
        if event.entity.valid then
          event.entity.die()
        end
        return
    end

    elseif (computer[1] ~= nil) and (computer[1].valid) and (computer[1].name == "quantum-chest") and (computer[1].active == false) and (event.entity.name == "bit-combinator") then
      if (event.entity.get_control_behavior().get_signal(1).signal.type == "item") then
        if global.quantum_chests and global.quantum_chests[computer[1].surface.name] == nil then
          if computer[1].active == false and computer[1].valid then
            computer[1].link_id = hash(signals.signal4)
            computer[1].get_inventory(defines.inventory.chest).set_bar()
            for i = 1, 64, 1 do
              if computer[1].get_inventory(defines.inventory.chest).can_set_filter(i, signals.signal4) then
                computer[1].get_inventory(defines.inventory.chest).set_filter(i, signals.signal4)
                computer[1].active = true
                if event.entity.valid then
                  event.entity.die()
                end
              end
            end
          end
        else
          if player and player.connected then
            player.print("Only one quantum chest can be present in a simulation.")
          end
        end
      else
        if player and player.connected then
          player.print("Please set all of the signals correctly. Only item signals are allowed to configure quantum chests.")
        end
      end
    else
      if player and player.connected then
        player.print("Bit and Byte combinators can only operate on unconfigured quantum computers of tiers 2 - 4 (only in the main simulation) and quantum chests.\nYou can check the combinator description or visit FAQ to read how it works.")
      end
    end
  end
end

--[[
script.on_event(defines.events.on_player_created, function(event)
  create_gui(event.player_index)
end)

script.on_event(defines.events.on_player_joined_game, function(event)
  create_gui(event.player_index)
end)
--]]

script.on_event("teleport", check_port)
script.on_event(defines.events.on_lua_shortcut, check_port)
script.on_event(defines.events.on_gui_closed, check_combinator)
script.on_nth_tick(7200, check_computer_status)