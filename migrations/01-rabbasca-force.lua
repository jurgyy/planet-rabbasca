-- Workaround for robots expanding into biter nests on rabbasca for no reason at all

local force = game.create_force("rabbascans")
force.ai_controllable = false
force.share_chart = true
force.set_cease_fire(game.forces.player, false)
game.forces.player.set_cease_fire(force, false)

local rabbasca = game.surfaces["rabbasca"]
if not rabbasca then return end 

for _, e in pairs(rabbasca.find_entities_filtered{force = "enemy"}) do
    e.force = game.forces.rabbascans
end