local RECEIVER_RADIUS = 75
-- TODO: Use items_to_place_this?
local function try_build_ghost(entity)
    if not entity.valid then return false, false end
    local proto = entity.ghost_prototype
    if not proto then return false, false end
    local builder = storage.rabbasca_remote_builder
    if not builder then return false, false end

    local radius = RECEIVER_RADIUS
    local receivers = entity.surface.find_entities_filtered{
        area = {
            {entity.position.x - radius, entity.position.y - radius},
            {entity.position.x + radius, entity.position.y + radius}
        },
        name = "rabbasca-remote-receiver",
    }
    local covered = false
    for _, receiver in pairs(receivers) do
        if receiver.valid and not receiver.to_be_deconstructed() then
            covered = true
            break
        end
    end
    if not covered then return false, false end

    local name, quality = entity.ghost_prototype.name, entity.quality.name
    storage.rabbasca_pending_ghosts[name] = storage.rabbasca_pending_ghosts[name] or {}
    storage.rabbasca_pending_ghosts[name][quality] = storage.rabbasca_pending_ghosts[name][quality] or {}
    local item_with_quality = { name = name, quality = quality }

    if builder.valid
    and not builder.to_be_deconstructed()
    and builder.get_inventory(defines.inventory.chest).get_item_count(item_with_quality) > 0 then
        local _, revived, proxy = entity.revive{ raise_revive = true } -- proxy relevant?
        if revived then 
            builder.get_inventory(defines.inventory.chest).remove(item_with_quality) 
            return true, true
        end
    end
    return false, true
end

local function on_added_ghost(entity)
    local built, covered_by_receiver = try_build_ghost(entity)
    if built or not covered_by_receiver then return end
    local name, quality = entity.ghost_prototype.name, entity.quality.name
    local ghosts = storage.rabbasca_pending_ghosts[name][quality]
    for _, g in ipairs(ghosts) do
        if g == entity then return end
    end
    table.insert(storage.rabbasca_pending_ghosts[name][quality], entity)
end

local function attempt_build_pending_ghosts()
    local builder = storage.rabbasca_remote_builder
    if not builder then return end
    local inventory = builder.get_inventory(defines.inventory.chest)
    if not storage.rabbasca_pending_ghosts then return end
    for name, by_quality in pairs(storage.rabbasca_pending_ghosts) do
        for quality, ghosts in pairs(by_quality) do
            local count = inventory.get_item_count{ name = name, quality = quality }
            if count > 0 then
                for i, entity in ipairs(ghosts) do
                    local built, covered_by_receiver = try_build_ghost(entity)
                    if built or not covered_by_receiver then
                        table.remove(ghosts, i) 
                        return -- Only build one 
                    end
                end
            end
        end
    end     
end

local function on_added_receiver(entity)
    local radius = RECEIVER_RADIUS
    local ghosts = entity.surface.find_entities_filtered{
        area = {
            {entity.position.x - radius, entity.position.y - radius},
            {entity.position.x + radius, entity.position.y + radius}
        },
        name = "entity-ghost"
    }
    for _, ghost in pairs(ghosts) do
        on_added_ghost(ghost)
    end
end

script.on_event(defines.events.on_pre_ghost_deconstructed, function(event)
    if not event.entity or not event.entity.ghost_prototype or not event.entity.valid then return end
    local name, quality = event.entity.ghost_prototype.name, event.entity.quality.name
    local ghosts = (((storage.rabbasca_pending_ghosts or {})[name] or {})[quality])
    if not ghosts then return end
    for i = #ghosts, 1, -1 do
        if ghosts[i] == entity then
            table.remove(ghosts, i)
        end
    end
end)

local build_events = {
    defines.events.on_built_entity,
    defines.events.on_robot_built_entity,
    defines.events.on_space_platform_built_entity,
    defines.events.script_raised_built
}

script.on_event(build_events, function(event)
  if not event.entity.valid then return end
  if event.entity.name == "rabbasca-remote-builder" then
    storage.rabbasca_remote_builder = event.entity -- Only one allowed for simplicity
    return
  end
  if event.entity.name == "rabbasca-remote-receiver" then
    storage.rabbasca_remote_receivers = storage.rabbasca_remote_receivers or {}
    storage.rabbasca_remote_receivers[event.entity.surface_index] = storage.rabbasca_remote_receivers[event.entity.surface_index] or {}
    table.insert(storage.rabbasca_remote_receivers[event.entity.surface_index], event.entity)
    on_added_receiver(event.entity)
    return
  end

  if event.entity.name == "entity-ghost" and event.entity.ghost_prototype then
    on_added_ghost(event.entity)
  end
end)

script.on_nth_tick(60, attempt_build_pending_ghosts)

local removal_events = {
    defines.events.on_entity_died,
    defines.events.on_player_mined_entity,
    defines.events.on_robot_mined_entity,
    defines.events.on_space_platform_mined_entity,
    defines.events.on_player_mined_tile,
    defines.events.on_robot_mined_tile,
    defines.events.on_space_platform_mined_tile,
}

local function remove_receiver(entity)
    local receivers = storage.rabbasca_remote_receivers and storage.rabbasca_remote_receivers[entity.surface_index]
    if not receivers then return end

    for i = #receivers, 1, -1 do
        if receivers[i] == entity then
            table.remove(receivers, i)
        end
    end
end

script.on_event(removal_events, function(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end

    if entity == storage.rabbasca_remote_builder then
        storage.rabbasca_remote_builder = nil
    elseif entity.name == "rabbasca-remote-receiver" then
        remove_receiver(entity)
    end
end)