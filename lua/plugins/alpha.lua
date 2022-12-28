local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[                    ./                     ]],
	[[         .%&&%%#   %%%                     ]],
	[[            %%%%#  %%%%%/                  ]],
	[[            .%&%%% #%%%%#                  ]],
	[[             .%%%%%%%%%%#                  ]],
	[[  %%#         ,%%%%%%%%%(                  ]],
	[[  %%%%%%.      ,%%%%%%%%%%.                ]],
	[[  %%%%%%%#      *%%%%%%%%%%&*              ]],
	[[    *%%%%%%*    *%%%%%%&&&&%%%/            ]],
	[[          ,%%%%%%%%%%%%#    .&%%#      ,.  ]],
	[[        .%%%%%%%%%%%%%%%%&@@%//%%%%(       ]],
	[[     #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%#    ]],
	[[  /%%%%%%%%%%%%%%%%,  ,%%%%%%%%%%%%%%%%&%  ]],
	[[  %%%%%%%%%%%%%%%%%#        *%&%%%%%%%#,   ]],
	[[  %%%%%%%%%%%/*%%%%%%%                     ]],
	[[  %%%%%%%%%%*  .%%%%%%%                   ]],
}

dashboard.section.buttons.val = {
	dashboard.button("<C-P>", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("<CS-F>", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = "jescas981@gmail.com"

-- TODO: Add Telescope Projects Command
alpha.setup(dashboard.opts)
