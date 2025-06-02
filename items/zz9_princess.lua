--Princess

SMODS.Atlas{
    key = 'princess',
    path = 'princess.png',
    px = 71,
    py = 95,
}
SMODS.Joker {
    key = "princess",
        loc_txt= {
        name = 'The Princess',
        text = { "If the poker hand played requires {C:attention}3 cards or fewer{}", 
        "then  {C:attention}level up by 3{} the played hand",
    },},
    atlas = 'princess',
    pos = { x = 0, y = 0 },
    soul_pos = {x = 0, y = 1},
    rarity = 4,
    cost = 25,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    
    --- the function
    
    ---down is the part that calculate that princess
calculate = function(self, card, context)
	if context.before then
	if context.scoring_name == "High Card" then
		return {
			message = 'Upgraded!',
			level_up = 3
		}
		end
	if context.scoring_name == "Pair" then
		return {
			message = 'Upgraded!',
			level_up = 3
		}
	end
	if context.scoring_name == "Three of a Kind" then
		return {
			message = 'Upgraded!',
			level_up = 3
		}
	end
	end
	end
}
