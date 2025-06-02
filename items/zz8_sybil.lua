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
        text = { "When defeating a {C:attention}Small Blind{}, gain{C:blue} +20{} Chips",
			"When defeating a {C:attention}Big Blind{}, gain{C:red} +5{} Mult",
			"When defeating a {C:attention}Boss Blind{}, gain{X:red,C:white} x 0.5{} Mult",
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
		return { vars = { card.ability.extra.chips, card.ability.extra.additional, card.ability.extra.mult, card.ability.extra.xmult }  }
    end,
    
    ---down is the part that calculate that Sybil
        calculate = function(self, card, context)
        if context.joker_main then
        return {
	     message = "+".. card.ability.extra.chips,
            chip_mod = card.ability.extra.chips,
            		extra = {
	   		  message = "+".. card.ability.extra.mult,
          	 	 mult_mod = card.ability.extra.mult,
          			  extra = {
	   			  message = "x".. card.ability.extra.xmult,
          			  Xmult_mod = card.ability.extra.xmult
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
