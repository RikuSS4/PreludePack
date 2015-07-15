# Modify recipe for Chisel's chisel
recipes.remove(<chisel:chisel>);
recipes.addShaped(<chisel:chisel>, [[<minecraft:iron_ingot>],[<minecraft:stick>]]);

#Missing Recipe
recipes.addShaped(<magicalcrops:magicalcrops_WitherProof>, [[<minecraft:stone>,<minecraft:obsidian>,<minecraft:stone>],[<minecraft:obsidian>,<magicalcrops:magicalcrops_WitherEssence>,<minecraft:obsidian>],[<minecraft:stone>,<minecraft:obsidian>,<minecraft:stone>]]);

#Fix AOBD Draconium Block replacing Draconic Evolution Draconium Block
val blockDraconium = <ore:blockDraconium>;
blockDraconium.add(<DraconicEvolution:draconium>);
blockDraconium.remove(<aobd:blockDraconium>);
recipes.removeShaped(<aobd:blockDraconium>);

#Ore Dictionary Removal
#BoP Flesh Block OD entry Removal to prevent exploit with MRF Meat Block crafting into 9 meat ingots
val entry = <ore:blockMeatRaw>;
entry.remove(<BiomesOPlenty:flesh>);

#Amber
#Fix Biomes o' Plenty and Thaumcraft recipes to use ore dictionary Amber
val gemAmber = <ore:gemAmber>;
recipes.removeShaped(<BiomesOPlenty:gemOre:15>);
recipes.addShaped(<BiomesOPlenty:gemOre:15>, [[gemAmber, gemAmber, gemAmber], [gemAmber, gemAmber, gemAmber], [gemAmber, gemAmber, gemAmber]]);
recipes.removeShaped(<Thaumcraft:blockCosmeticOpaque>);
recipes.addShaped(<Thaumcraft:blockCosmeticOpaque>, [[gemAmber, gemAmber], [gemAmber, gemAmber]]);
recipes.removeShaped(<Thaumcraft:ItemResource:6> * 4);
recipes.addShaped(<BiomesOPlenty:gems:7> * 4, [[<Thaumcraft:blockCosmeticOpaque>]]);
recipes.addShaped(<BiomesOPlenty:gems:7> * 4, [[<Thaumcraft:blockCosmeticOpaque:1>]]);
