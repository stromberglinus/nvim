require("nvim-autopairs").setup({})

local ok_cmp, cmp = pcall(require, "cmp")
local ok_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if ok_cmp and ok_cmp_autopairs then
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
