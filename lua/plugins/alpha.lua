return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			local logo = {
				"⠀⠀⠀⠀⢀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠁⠁⠄⡀⠢⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠁⠄⠂⡐⢐⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠁⠄⠂⡈⠢⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠁⠄⠂⡑⢄⠂⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⠀⢂⠑⢄⠂⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠠⠐⡀⠑⢔⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⡀⢀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢀⠡⢀⠑⢄⠂⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠄⠔⠐⡁⠡⢁⠨⠀⢂⠐⡀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⡂⠠⠑⢄⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠂⠡⠐⡀⠅⠂⡐⢈⠠⠀⠅⡀⢂⠠⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢀⠡⠀⠂⠡⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠈⠄⡀⠂⠄⠡⠀⠂⠄⠡⠐⢀⠂⠠⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡈⠐⡈⠀⢂⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠄⠄⠄⠂⠄⠂⡐⠀⠄⠀⠁⠄⠂⢈⠠⠁⠌⠐⢈⠐⠠⠈⠄⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⢀⠅⠂⠠⢁⠂⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⡉⠄⠂⢂⠨⠐⠈⠄⠠⢁⠨⠀⠄⠈⡐⠀⠐⠈⠠⠈⠄⠂⡁⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠄⠠⠨⠐⡀⢂⠠⠀⠀⠀⠀⠀⠀⠀⡠⠃⡐⠀⡂⠡⠀⢂⠨⢀⠁⡂⠐⡀⠡⠈⠠⠀⢂⠈⠄⠡⢈⠠⠁⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢁⠊⠀⠄⠀⠂⡁⡂⠄⡀⠀⠐⠀⡂⠄⠡⠀⢂⠡⠀⡂⠄⢂⠠⠁⢀⠂⡈⠄⠡⠀⢂⠁⢂⠐⠠⠈⠄⠀⠀⠠⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⢀⢁⠂⠄⠂⡐⢀⠁⡂⠀⡐⢀⠡⢈⠠⠀⠅⡀⠂⠐⡀⢐⠀⢂⠐⡀⠡⠈⠄⡈⠄⠂⡁⠂⡁⠀⠀⠀⠀⠀⠠⠀⠂⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠨⢀⠡⠀⠂⡐⢀⠂⢐⠀⠂⠄⠂⠡⠐⢀⢁⠡⠐⡀⠌⠠⠐⢀⠂⠡⠐⠀⠂⠡⠀⡡⡆⠀⠀⠀⠀⠀⠀⠀⠨⠀⠄⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁⠀⡂⠈⠄⡀⠂⡀⢂⠈⠄⠡⠈⠄⠡⠠⠀⡂⠐⡀⠂⡁⠌⠀⡐⠐⡀⢂⠠⠀⠊⠎⢞⠄⠀⠀⠀⠀⢀⠈⠄⡁⠌⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠄⠊⠀⠀⠀⠀⡁⠄⠐⡀⢂⠡⢈⠂⡁⠂⠁⠀⠂⠁⠀⠁⠀⡁⠄⠂⡁⢐⠀⠂⠄⢂⠈⠄⢂⠠⠁⡀⢀⠠⠐⢀⠂⡐⠀⠅⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁⠀⠈⠠⠐⢀⠀⠅⠠⠈⠄⠐⠠⠐⠀⠂⠀⢀⣶⣶⣶⠖⠋⢀⠐⡀⠂⡁⢐⠀⠌⠠⠁⠄⢂⠈⠄⠠⠁⠄⠂⡐⢈⠠⠐⢀⠁⠅⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠂⠀⠈⠀⠁⠈⠈⡀⠀⠀⠐⠚⠛⠛⠛⠁⠀⠀⠂⡐⡀⠡⠐⢀⠂⡈⠄⠁⠂⠐⠀⡁⠄⡁⢂⠁⠄⠂⡐⢈⠀⡂⢑⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⢀⠀⡂⠄⢁⠂⢂⠠⠀⠄⢀⠂⡁⡁⠅⠂⢌⢐⠡⢀⠂⠀⠀⠀⡐⢀⠡⠀⠂⠄⠂⡐⠈⠄⠐⡀⠂⠄⠂⠄⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠅⡀⠂⠐⠀⠂⠈⠄⢂⠐⡀⠡⠈⠄⡂⢂⠄⠂⠡⠐⠠⠈⠄⢀⠠⠀⠅⡀⢂⠀⠡⠈⠄⡁⢐⠈⠄⢁⠐⡈⠠⢁⠨⢀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⡀⡀⡀⡠⡀⡀⠀⠀⠀⠈⠀⠁⡂⡐⠨⠀⠁⢈⢀⠠⠠⠁⡈⠄⠡⠀⢂⠈⠄⡈⠠⠐⠀⠄⠨⠀⢂⠐⡀⢂⠐⠠⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣪⢪⡺⡜⣎⠎⡑⡦⡂⠢⡱⣕⡲⢐⢬⢢⠑⠀⠀⡂⠂⡁⠀⠄⠈⠄⠐⡀⠡⠐⠀⡈⠠⠈⠄⠡⠀⠂⠄⠂⠄⠅⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣪⣣⢳⡱⠃⢔⢸⢪⢝⠄⣇⡗⠠⢊⢮⡣⠃⠀⠀⡢⠡⡀⡂⠄⠂⢀⠁⠐⠈⢀⠔⠁⠁⠡⠨⢀⢁⠡⠈⢠⠊⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⢤⡰⡔⡆⢑⢐⢬⢣⡱⢱⢔⢬⠨⢸⣸⠈⡂⠁⠀⠀⠁⠐⠈⠐⡁⠄⡀⠂⠀⠂⠀⠂⠁⡀⠂⠀⠂⠄⠕⠁⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣪⢮⢺⢜⢞⢄⢢⢳⢕⢡⢏⢮⢳⡱⢅⠂⠊⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⠀⡁⢀⠁⡀⢁⠀⠄⠁⠂⠁⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⡳⣣⢳⢕⡳⡹⣜⢬⡸⣸⡱⠝⠜⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠝⡮⡪⣇⢗⢝⡎⣞⢜⢮⠪⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁⠈⣕⢇⡏⡧⡳⠑⠑⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⠀⢰⢣⡳⡹⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⠀⢀⡏⡮⡊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠆⠀⡲⡹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⠀⢐⠭⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠈⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ",
			}
			local get_config_path = function()
				if _G.IS_WSL then
					return "cd ~/.config/nvim | :e init.lua<CR>"
				else
					return "cd $HOMEAppDataLocal\nvim"
				end
			end

			local purple = "Identifier"
			dashboard.section.header.val = logo
			dashboard.section.header.opts.hl = purple
			dashboard.section.buttons.val = {
				dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
				dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("c", "⚙  > Configuration", get_config_path()),
				dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
			}
			alpha.setup(dashboard.opts)
		end,
	},
}
