require("project_nvim").setup()

-- Intégration Telescope
local ok, telescope = pcall(require, "telescope")
if ok then
  telescope.load_extension("projects")
end
