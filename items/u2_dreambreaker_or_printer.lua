--MERGE FUNCTION
local function merge_effect(...)
    local t = {}
    for _, v in ipairs({...}) do
        for _, vv in ipairs(v) do
            table.insert(t, vv)
        end
    end
    local ret = table.remove(t, 1)
    local current = ret
    for _, eff in ipairs(t) do
        assert(type(eff) == 'table', ("\"%s\" is not a table."):format(tostring(eff)))
        while current.extra ~= nil do
            if current.extra == true then
                current.extra = { remove = true }
            end
            assert(type(current.extra) == 'table', ("\"%s\" is not a table."):format(tostring(current.extra)))
            current = current.extra
        end
        current.extra = eff
    end
    return ret
end
 
--drimprint stuff (the stupid blue)
    
local stupidblue = function(card, other_joker, context)
    if pseudorandom('cymbal_dprinter') < G.GAME.probabilities.normal / card.ability.extra.odds then
        local blue1 = SMODS.blueprint_effect(card, other_joker, context)
        local blue2 = SMODS.blueprint_effect(card, other_joker, context)

        return merge_effect({blue1}, {blue2})
    end
    -- returns nil if condition fails
end
    
    -- Dream Printer
SMODS.Atlas{
    key = 'dprinter',
    path = 'dreamprint.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "dprinter",
        loc_txt= {
        name = 'Dream Printer',
        text = { "Copy the abbilities of the joker on the {C:attention}right",
        "{C:green}#1# in 3 Chances{} to trigger it 2 more times",
        "{C:inactive} (How can this exist ?)"
    },},
    atlas = 'dprinter',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 15,
    pools = {["pseudoregamod"] = true},
    
        unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    
    config = { extra = { odds = 3}},
    
    --return { vars = { center.ability.extra.mainodds, center.ability.extra.totalodds}  }
    
    
--create  the 'other_joker' vallue as well of adding the 1/3 chance, normally
    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local other_joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card and G.jokers.cards[i + 1] then
                    other_joker = G.jokers.cards[i + 1]
                end
            end
        end
            return { vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
--gotta re-add the function of before

    calculate = function(self, card, context)
        local other_joker
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card and G.jokers.cards[i + 1] then
                other_joker = G.jokers.cards[i + 1]
            end
        end
        
    if other_joker then
        local defaultblue = SMODS.blueprint_effect(card, other_joker, context)
        local stupidblue_effect = stupidblue(card, other_joker, context)
        return merge_effect({defaultblue}, {stupidblue_effect}) --merge_effect isn't a real thing, look up the local merge effect
    end
end
}

-- Dream Breaker
SMODS.Atlas{
    key = 'dbreaker',
    path = 'dreambreaker.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "dbreaker",
        loc_txt= {
        name = 'Dream Breaker',
        text = { "{X:mult,C:white}x15{} when there's",
        "{C:attention}2{} hands and",
        "{C:attention}0{} discard left"
    },},
    atlas = 'dbreaker',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 15,
    pools = {["pseudoregamod"] = true},
    
            unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    config = {extra = { xmult = 15}},
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.xmult}}
    end,

calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.hands_left ~= 2 and G.GAME.current_round.discards_left == 0 then
            return {
        message = "x" .. card.ability.extra.xmult,
        Xmult_mod = card.ability.extra.xmult
        }
    end
end

    }


