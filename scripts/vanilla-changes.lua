if settings.startup["remove-tree-seeding-requirement"].value then
    local preq = data.raw["technology"]["fish-breeding"].prerequisites
    for i = 1, #preq do 
        if preq[i] == "tree-seeding" then
            table.remove(preq, i)
            table.insert(preq, "agricultural-science-pack")
            break
        end
    end
end