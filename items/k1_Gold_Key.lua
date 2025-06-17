SMODS.Atlas{
    key = 'regalia_Gkey',
    path = 'GoldKey.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "goldkey",
        loc_txt= {
        name = 'Gold Key',
        text = { "{X:mult,C:white}x5{} when entering a {C:attention}Boss Blind{}",
        "Vanishes if used during a {C:attention}Showodwn Boss Blind{}"
    },},
    atlas = 'regalia_Gkey',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 5,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    config = { extra = {xmult = 5}},
        loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult }  }
    end, 
    calculate = function(self, card, context)
        local isBossBlind = G.GAME.blind.boss
        local isShowdown = G.GAME.round_resets.ante % 8 == 0 --(might be innacurate, but should normall go for showdown boss blinds) -- G.GAME.blind.config.blind.boss.showdown

        if context.joker_main and isBossBlind then
            if isShowdown and not context.blueprint then
                card:start_dissolve({ G.C.RED })  
            else
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}
	
