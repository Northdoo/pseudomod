-- Goatling


SMODS.Atlas{
    key = 'goatling',
    path = 'goatling.png',
    px = 71,
    py = 95,
}
SMODS.Joker {
    key = "goatling",
        loc_txt= {
        name = 'Goatling',
        text = { "{X:chips,C:white}x3{} {C:blue}Chips",
                    "For any card that scores",
                    "that isn't a {C:attention}King, Queen or Jack{} ",
    },},
    atlas = 'goatling',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 4,
    cost = 30,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    
    config = { extra = {x_chips = 3}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.x_chips_gain}  }
    end,
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and (context.other_card:get_id() <= 10 or context.other_card:get_id() == 14) then
            return {
               x_chips = card.ability.extra.x_chips,
               x_chips_message = {message = "x" .. tostring(card.ability.extra.x_chips)}
            }
        end
    end
}

--Sybil

SMODS.Atlas{
    key = 'sybil',
    path = 'sybil.png',
    px = 71,
    py = 95,
}
SMODS.Joker {
    key = "sybil",
        loc_txt= {
        name = 'Sybil',
        text = { "When defeating a {C:attention}Small Blind{}, gain{C:blue} +#2#{} Chips",
			"When defeating a {C:attention}Big Blind{}, gain{C:red} +#6#{} Mult",
			"When defeating a {C:attention}Boss Blind{}, gain {X:red,C:white}x#5#{} Mult",
			"{C:inactive} (Currently at{} {C:chips}+#1#{}{C:inactive} Chips,{C:mult}+#3#{}{C:inactive} Mult and {}{X:mult,C:white}x#4#{}{C:inactive} Mult){}",
    },},
    atlas = 'sybil',
    pos = { x = 0, y = 0 },
    soul_pos = {x = 0, y = 1},
    rarity = 4,
    cost = 25,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    
    --- the function
    config = { extra = {chips = 0, mult = 0,  xmult = 1, additional = 20, mult_gain = 5,xmult_gain = 0.5}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.additional, card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.xmult_gain, card.ability.extra.mult_gain  }  }
    end,
    
    ---down is the part that calculate that Sybil
        calculate = function(self, card, context)
        if context.joker_main then
        return {
	     --message = "+".. card.ability.extra.chips,
            chips = card.ability.extra.chips,
            		extra = {
	   		  --message = "+".. card.ability.extra.mult,
          	 	 mult = card.ability.extra.mult,
          			  extra = {
	   			  --message = "x".. card.ability.extra.xmult,
          			  xmult = card.ability.extra.xmult
            }
          }
        }
    end
    ---down is the part that upgrades
		if context.end_of_round and context.main_eval and not context.blueprint then
		if (G.GAME.blind.boss) then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = "Upgrade!"
            }
	elseif  (G.GAME.blind:get_type() == 'Big') then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = "Upgrade!"
            }
	elseif  (G.GAME.blind:get_type() == 'Small') then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.additional
            return {
                message = "Upgrade!"
            }
        end
end
end
}

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
