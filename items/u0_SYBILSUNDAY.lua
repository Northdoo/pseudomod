
    local SybilSunday = (os.date("%A") == "Sunday")
    
SMODS.Atlas{
  key = 'sybsun',
    path = 'sybilsunday.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "sundae",
        loc_txt= {
        name = 'Sybil Sunday',
        text = {    "If you're playing on a {s:1.2,C:attention}Sunday{}",
   			 "have a 'free' {X:mult,C:white}x7{} Mult just for you !",
   			 "{C:inactive}#2#{}",
    },},
    atlas = 'sybsun',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 7,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    
    --- the function
    config = { extra = {xmult = 7, active = "(Checking the day..)"}},
    loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.xmult, card.ability.extra.active }  }
    end,
    
update = function(self, card, front)
    if SybilSunday then
        card.ability.extra.active = "(And today IS Sunday !)"
    else
        card.ability.extra.active = "(Sadly, today isn't sunday..)"
    end
end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            if not SybilSunday then
                return {
                    color = G.C.INACTIVE, --won't actually do anything sadly
                    message = "Not Sunday.",
                }
            elseif SybilSunday then
                return {
            	    color = G.C.GOLD, --won't actually do anything sadly
                    message = "SYBIL SUNDAY !!!",
                    extra = {
	   			  message = "x".. card.ability.extra.xmult,
          			  Xmult_mod = card.ability.extra.xmult }
                }
            end
        end
    end
}

