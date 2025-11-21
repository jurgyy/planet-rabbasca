local rabbasca = game.surfaces["rabbasca"]
if not rabbasca then return end 

for _, e in pairs(rabbasca.find_entities_filtered{ name = "rabbascan-scrap" }) do
  e.destroy{}
end

rabbasca.regenerate_entity({ "rabbasca-vault-crafter", "rabbascan-scrap" })
game.print("[space-location=rabbasca] Update 0.7 altered a some recipes, with notable changes to [entity=rabbascan-scrap] and [item=calcite]/[item=stone]/[item=advanced-circuit] acquisition. Make sure to check your factory on Rabbasca and the mod's changelog.")