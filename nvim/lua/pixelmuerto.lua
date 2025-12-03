return {
  {
    dir = vim.fn.stdpath("config") .. "/pack/pixelmuerto",
    name = "pixelmuerto",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("pixelmuerto")
    end,
  },
}
