
local myname, ns = ...

local PASSLIST = [[
20858 20859 20860 20861 20862 20863 20864 20865
20866 20867 20868 20869 20870 20871 20872 20873
20874 20875 20876 20877 20878 20879 20881 20882
]]

ns.RegisterEvent('START_LOOT_ROLL', function(event, rollid)
	if not rollid then return end

	local texture, name, count, quality, bop = GetLootRollItemInfo(rollid)
	local link = GetLootRollItemLink(rollid)
	local id = ns.ids[link]

	if id and PASSLIST:find("%s"..id.."%s") then return RollOnLoot(rollid, 0) end
	if quality == 2 and not bop then return RollOnLoot(rollid, 2) end
end)
