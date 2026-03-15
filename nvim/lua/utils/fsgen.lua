local M = {}

-- TODO: toolchain to create file structure for diffrent types

---@param cwd string root dir
---@param dir string build dir
function M.cmake(cwd, dir)
    vim.system({ "cmake", "-S", cwd, "-G", "\"Unix Makefiles\"", "-B", dir }):wait()
end

---@param cwd string root dir
function M.create_clangd_config(cwd)
    if not vim.fn.filereadable(cwd .. ".clangd") then
    end
end

return M
