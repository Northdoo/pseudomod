SMODS.Atlas{
  key = 'regaliahand',
    path = 'HeavenHand.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "regaliahand",
        loc_txt= {
        name = 'Heaven Ward',
        text = {
            "Gain {C:money}$1{} when",
            "scoring a {C:attention}High Card{}",
            "Resets when the scoring hand contains a",
            "{C:attention}Straight, Flush, or Full House{}",
            "{C:inactive}(Currently at{} {C:money}#1#${}{C:inactive}){}"
        }
    },
    atlas = 'regaliahand',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    
    config = { extra = {dollar = 0,additional = 1}},
    	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollar, card.ability.extra.additional}  }
	end,
	
    calculate = function(self, card, context)

        if context.before then
        if next(context.poker_hands['Straight']) or next(context.poker_hands['Flush']) or next(context.poker_hands['Full House']) then
	card.ability.extra.dollar = 0
        return {
        message = "Reset..",
        }
	elseif context.scoring_name == "High Card" then
	card.ability.extra.dollar = (card.ability.extra.dollar + card.ability.extra.additional)
	return {
        dollars = card.ability.extra.dollar
			}
		end
	end
end
}
	
        
