return {
  {
    "DaikyXendo/nvim-material-icon",
    priority = 1000,
    config = function()
      -- material-icon의 lua 경로를 먼저 등록해서 nvim-web-devicons를 대체
      local material_path = vim.fn.stdpath("data") .. "/lazy/nvim-material-icon/lua"
      package.path = material_path .. "/?.lua;" .. material_path .. "/?/init.lua;" .. package.path
      -- 기존 캐시 제거
      package.loaded["nvim-web-devicons"] = nil
      require("nvim-web-devicons").setup()
    end,
  },
}
