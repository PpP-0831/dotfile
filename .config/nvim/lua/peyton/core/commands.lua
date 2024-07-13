-- glsl file detection
function SetFileType(original, target)
  vim.cmd("autocmd BufReadPost,BufNewFile *." .. original .. " set filetype=" .. target)
end

SetFileType("vert", "glsl")
SetFileType("frag", "glsl")

-- hyprlang file detection
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- vim.cmd("autocmd BufReadPost,BufNewFile *.norg setlocal conceallevel=2")
vim.cmd("autocmd BufReadPost,BufNewFile *.md setlocal conceallevel=2")
vim.cmd("autocmd BufReadPost,BufNewFile *.md setlocal wrap")
