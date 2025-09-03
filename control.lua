function init_moon_chest(surface) 
    if storage["moonstone-inventory-created"] ~= nil then return end
    storage["moonstone-inventory-created"] = surface.create_entity {
      name = "harenian-monument",
      position = surface.find_non_colliding_position("harenian-monument", {0, 0}, surface.get_starting_area_radius(), 1)  or {0, 0},
      force = game.forces.neutral,
      raise_built = true
    }
    -- for _, vent in pairs(surface.find_entities_filtered({name = "harene-vent"})) do
    --     local a = surface.create_entity{
    --         name = "harene-extractor",
    --         position = vent.position,
    --         force = game.forces.neutral,
    --         raise_built = true
    --     }
    --     local b = surface.create_entity{
    --         name = "harenic-chemical-plant",
    --         position = surface.find_non_colliding_position("harenic-chemical-plant", vent.position, 8, 1),
    --         force = game.forces.neutral,
    --         raise_built = true
    --     }
    --     local c = surface.create_entity{
    --         name = "harenic-chemical-plant",
    --         position = surface.find_non_colliding_position("harenic-chemical-plant", vent.position, 8, 1),
    --         force = game.forces.neutral,
    --         raise_built = true
    --     }
    --     if not a or not b or not c then
    --       game.print("[color=red]ERROR[/color]: Could not spawn initial structures on Rabbasca")
    --     end
    -- end
    if not storage["moonstone-inventory-created"] then
        game.print("[color=red]ERROR[/color]: Could not spawn monument on Rabbasca")
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
  if effect_id == "rabbasca-ears-core-offering-complete" then
    local monument = storage["moonstone-inventory-created"]
    if not monument then return end
    local recipe = monument.get_recipe()
    monument.set_recipe(nil)
    if not recipe then return end
    local current_id = recipe.name:gsub("^rabbasca%-offering%-", "")
    if not current_id then return end
    local next_id = tonumber(current_id) + 1
    monument.set_recipe("rabbasca-offering-"..next_id)
    game.print("Offering next: "..next_id)
  end
  if effect_id == "rabbasca_rescue_item" then 
    local monument = storage["moonstone-inventory-created"]
    if not monument then return end
    game.print("helping fellow items")
    local item = event.source_entity
    if not item then return end
    game.print("rescued an important item from certain death...")
    local pod = monument.create_cargo_pod()
    pod.insert({name = item.name, amount = 1})
    pod.cargo_pod_destination = {
      type = defines.cargo_destination.surface,
      surface = monument.surface,
      position = monument.position
    }
    item.destroy()
    return
  end
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

script.on_event(defines.events.on_chunk_generated, function(event)
  if event.surface ~= game.planets["rabbasca"].surface then return end
  local surface = event.surface

  if math.abs(event.position.x) + math.abs(event.position.y) < 8 then 
    return
    -- for _, power in pairs(surface.find_entities_filtered({area = event.area, name = "small-harenide-collider"})) do
    --     if power.force == game.forces.neutral then return end -- make sure this only triggers once per entity
    --     power.force = game.forces.neutral
    --     surface.create_entity{
    --         name = "moonstone-chest",
    --         position = surface.find_non_colliding_position("moonstone-chest", power.position, 5, 1),
    --         force = power.force,
    --         raise_built = true
    --     }
    --     surface.create_entity{
    --         name = "moonstone-chest",
    --         position = surface.find_non_colliding_position("moonstone-chest", power.position, 5, 1),
    --         force = power.force,
    --         raise_built = true
    --     }
        -- local corpse = surface.create_entity{
        --     name = "character-corpse",
        --     position = surface.find_non_colliding_position("character-corpse", power.position - {x = 0, y = 7}, 5, 1),
        --     force = power.force,
        --     raise_built = true
        -- }
        -- if corpse then 
        --   corpse.insert({})
        -- end
    -- end
  else 
    for _, power in pairs(surface.find_entities_filtered({area = event.area, name = "small-harenide-collider"})) do
        if power.force == game.forces.neutral then return end -- make sure this only triggers once per entity
        local left_top = { power.position.x - 12, power.position.y - 12}
        local right_bottom = { power.position.x + 12, power.position.y + 12}

        -- local tiles = {}
        -- for x = left_top.x, right_bottom.x do
        --   for y = left_top.y, right_bottom.y do
        --     table.insert(tiles, {name = "harene-infused-foundation", position = {x, y}})
        --   end
        -- end
        -- surface.set_tiles(tiles)

        -- requires never version lol
        -- local territory = surface.create_territory{chunk = event.position}
        surface.create_entity{
            name = "moonstone-turret",
            position = surface.find_non_colliding_position("moonstone-turret", {power.position.x - 8, power.position.y}, 4, 1),
            force = power.force,
            raise_built = true
        }
        surface.create_entity{
            name = "moonstone-turret",
            position = surface.find_non_colliding_position("moonstone-turret", {x = power.position.x + 8, y = power.position.y}, 4, 1),
            force = power.force,
            raise_built = true
        }
        power.force = game.forces.neutral
    end
  end
end)