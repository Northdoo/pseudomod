SMODS.Atlas {
    key = "pseudoblinds",
    path = "blinds.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    name = "boss_memory",
    key = "boss_memory",
    atlas = "pseudoblinds",
    mult = 4,
    pos = { y = 0 },
    dollars = 8,
    loc_txt = {
        name = 'Distored Memory',
        text = {
            'Large Blind',
            '(Will be more challenging in the future)',
        }
    },
    boss = { showdown = true },
    boss_colour = HEX('521844'),
}
