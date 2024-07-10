-- glsl file detection
function SetFileType(original, target)
	vim.cmd("autocmd BufRead,BufNewFile *." .. original .. " set filetype=" .. target)
end

SetFileType("vert", "glsl")
SetFileType("frag", "glsl")

-- hyprlang file detection
vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
