function init_moon_chest(surface) 
    if settings.global["moonstone-inventory-created"].value == true then return end
    -- for _, pos in pairs({0, 0, 0}) do
        
    --     local chest = surface.create_entity{
    --         name = "harene-assembler",
    --         position = pos,
    --         force = game.forces.neutral,
    --         raise_built = true
    --     }
    --     if not chest then
    --         game.print("[color=red]ERROR[/color]: Could not fully create abandoned village on rabasca.")
    --         return
    --     end
    -- end

    local chests = 2
    for _, vent in pairs(surface.find_entities_filtered({name = "harene-vent"})) do
        local pos_a = surface.find_non_colliding_position("harene-extractor", vent.position, 2, 1)
        local ext = surface.create_entity{
            name = "harene-extractor",
            position = pos_a,
            force = game.forces.player,
            raise_built = true
        }
        if ext then
            local pos = surface.find_non_colliding_position("moonstone-chest", vent.position, 5, 1)
            local chest = surface.create_entity{
                name = "moonstone-chest",
                position = pos,
                force = game.forces.player,
                raise_built = true
            }
            if not chest then
                game.print("[color=red]ERROR[/color]: Could not spawn a moonstone-chest on rabbasca.")
            end
            chests = chests - 1
            if chests == 0 then
                settings.global["moonstone-inventory-created"] = {value = true}
                return
            end
        end
    end
    
end

script.on_event(defines.events.on_player_changed_surface,function(event)
    if not game.planets["rabbasca"].surface or game.planets["rabbasca"].surface.index ~= event.surface_index then return end
    init_moon_chest(game.planets["rabbasca"].surface)
end)

script.on_event(defines.events.on_player_created, function(event)
    if not game.planets["rabbasca"].surface then return end
    init_moon_chest(game.planets["rabbasca"].surface)
end)

local function handle_teleport_effect(event)
  local effect_id = event.effect_id
  if not effect_id or not effect_id:find("^rabbasca_teleport_") then return end

  -- Extract planet name
  local planet = effect_id:gsub("^rabbasca_teleport_", "")

  -- Safety: check player exists
  local player = event.target_entity.player
  if not player then return end

  -- Unlock research if it exists
  local tech_name = "planet-discovery-" .. planet
  for _, force in pairs(game.forces) do
    local tech = force.technologies[tech_name]
    if tech and not tech.researched then
      tech.researched = true
    end
  end

  -- Check surface exists
  local surface = game.planets[planet].surface or game.planets[planet].create_surface()
  if not surface then return end
  local radius = surface.get_starting_area_radius()
  player.force.chart(surface, {{-radius, -radius}, {radius, radius}})

  local start_pos = surface.find_non_colliding_position("character", {0, 0}, surface.get_starting_area_radius(), 1)  or {0, 0}

  -- Teleport player
  if not player.teleport(start_pos, surface) then return end
  player.print("[Teleport] You have been teleported to " .. planet)
end

-- Register event
script.on_event(defines.events.on_script_trigger_effect, handle_teleport_effect)