-- #textdomain wesnoth-Tunnel_Rats_part01

local helper = wesnoth.require "helper"
local T = helper.set_wml_tag_metatable {}
local wml_actions = wesnoth.wml_actions
local _ = wesnoth.textdomain "wesnoth-Tunnel_Rats_part01"

function wml_actions.select_gender()
	local gender_selection_dialog = {
		maximum_height = 250,
		maximum_width = 400,
		T.helptip { id="tooltip_large" }, -- mandatory field
		T.tooltip { id="tooltip_large" }, -- mandatory field
		T.grid {
			T.row {
				T.column {
					grow_factor = 1,
					border = "all",
					border_size = 5,
					horizontal_alignment = "left",
					T.label {
						definition = "title",
						label = _"Select the Epyllion's Main Character"
					}
				}
			},
			T.row {
				T.column {
					grow_factor = 1,
					border = "all",
					border_size = 5,
					horizontal_alignment = "left",
					T.label {
						label = _"Who do you want to play?"
					}
				}
			},
			T.row {
				T.column {
					T.grid {
						T.row {
							T.column {
								grow_factor = 1,
								border = "all",
								border_size = 5,
								T.image {
									label = "portraits/maincharacters/maincharacter_female.png"
								}
							},
							T.column {
								grow_factor = 1,
								border = "all",
								border_size = 5,
								T.image {
									label = "portraits/maincharacters/maincharacter_male.png~TC(1,magenta)"
								}
							}

						},
						T.row {
							T.column {
								grow_factor = 1,
								border = "all",
								border_size = 5,
								T.button {
									label = _"Shieldmaiden",
									return_value = 2
								}
							},
							T.column {
								grow_factor = 1,
								border = "all",
								border_size = 5,
								T.button {
									label = _"Watchman",
									return_value = 1
								}
							}

						}
					}
				}
			}
		}
	}

	local gender = wesnoth.show_dialog(gender_selection_dialog)
	local unit = wesnoth.get_variable("gender_store")

	if gender == 2 then
		wesnoth.put_unit({
			type = "TUNRA_protagonistine",
            gender = "female",
			id = unit.id,
			name = _"Hermine",
			unrenamable = true,
			profile="portraits/maincharacter_female.png",
			canrecruit = true,
            extra_recruit = "",
			facing = unit.facing,
		}, unit.x, unit.y )
	else
		wesnoth.put_unit({
			type = "TUNRA_protagonist",
            gender = "male",
			id = unit.id,
			name = _"Herman",
			unrenamable = true,
			profile="portraits/maincharacter_male.png",
			canrecruit = true,
            extra_recruit = "",
			facing = unit.facing,
		}, unit.x, unit.y )
	end
	wesnoth.redraw {}
end
