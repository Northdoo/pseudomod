SMODS.Atlas{
   key = 'sol',
    path = 'sol_ehancment.png',
    px = 71,
    py = 95,
}

SMODS.Enhancement {
key = 'sol',
	loc_txt = {
	name = "Sol Card",
	text =  {"{C:blue} +20{} chips",
	"Has no rank",
	"Is considered as any suit"
},},

    atlas = 'sol',
    pos = { x = 0, y = 0 },
    --pools = {["pseudoregamod"] = true},

--unlocked = true,
--discovered = true,

config = {
bonus = 20,
},
	replace_base_card = true,
	no_rank = true,
	no_suit = false,
	any_suit = true,
	always_scores = false,
}

