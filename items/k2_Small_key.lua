-- Small Key
SMODS.Atlas{
    key = 'key',
    path = 'smol_key.png',
    px = 69,
    py = 93,
}
SMODS.Joker {
    key = "key",
        loc_txt= {
        name = 'Small Key',
        text = {
            "Sell it to gain {C:attention}triple{} its sell value",
            "or wait {C:attention}3{} rounds to create",
            "2 {C:attention}Coupon Tags{} and 1 {C:attention}D6 Tag{}",
            "{C:inactive}(Currently {}{C:attention}#1#{}{C:inactive}/#2#)",
            "{C:inactive}(Sell value drops to 0$ once active)"
    },},
    atlas = 'key',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 8,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    
    config = { extra = { key_rounds = 0, total_rounds = 3, price = 8, yes = false } },
    loc_vars = function(self, info_queue, card)
     info_queue[#info_queue+1] = { key = 'tag_coupon', set = 'Tag' }
     info_queue[#info_queue+1] = { key = 'tag_d_six', set = 'Tag' }
		return { vars = { card.ability.extra.key_rounds, card.ability.extra.total_rounds, card.ability.extra_value, card.ability.extra.yes }  }
    end,
    
    calculate = function(self, card, context)
local RoundSet = card.ability.extra.key_rounds + 1

    if context.end_of_round and context.game_over == false and not context.blueprint then
    if card.ability.extra.key_rounds ~= card.ability.extra.total_rounds and RoundSet ~= 3 then
        card.ability.extra.key_rounds = card.ability.extra.key_rounds + 1
            return {
                message = card.ability.extra.key_rounds .. '/' .. card.ability.extra.total_rounds
            }
        else
            card.ability.extra.key_rounds = 3
            card.ability.extra.yes = true
            local eval = function(card) return not card.REMOVED end
            juice_card_until(card, eval, true)
            card.ability.extra_value = -4
            card:set_cost()
            return {
                message = localize('k_active_ex')
            }
        end
    end

    if context.selling_self and  card.ability.extra.yes == true then
        for _, t in ipairs({'tag_coupon', 'tag_d_six', 'tag_coupon'}) do
            add_tag(Tag(t))
            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
        end
    end
end,

    add_to_deck = function(self, card, from_debuff)
            card.ability.extra_value = 8
            card:set_cost()
    end
}
               --[[
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                blockable = false,
                func = function()
                    card:start_dissolve()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Used !"})
                    return true
                end
        }))
]]--


--[[
        if context.joker_main then
			return {
				message = "+".. card.ability.extra.chips,
				chip_mod = card.ability.extra.chips
			}
        end
		if context.setting_blind and not (G.GAME.blind.boss) and context.main_eval and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.additional
            return {
                message = "Upgrade!",
            }

--]]



