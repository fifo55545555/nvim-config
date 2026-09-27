vim.opt.termguicolors = true
vim.cmd.colorscheme("habamax")

local color_scheme = {}
color_scheme["main"] = "kanagawa"
color_scheme["statusline"] = "horizon"

--  =====================================================
--  ==                  OPTIONS HERE                   ==
--  =====================================================

vim.o.number = true -- numbered lines
vim.o.relativenumber = true -- relative line numbering
vim.o.cursorline = true -- highligth the line on witch the cursor is on
vim.o.wrap = false -- wrap lines when too long
vim.o.scrolloff = 10 -- how many lines bf scrolling
vim.o.sidescrolloff = 5 -- how many columns bf scrolling to the side
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "155"


local tabwidth = 4
vim.o.tabstop = tabwidth -- tabwidth
vim.o.shiftwidth = tabwidth -- indent size
vim.o.softtabstop = tabwidth -- tab/backspace ?

vim.o.expandtab = true -- tabs -> spaces
vim.o.smartindent = true -- smart autoindent
vim.o.autoindent = true -- copy indent of current line
vim.opt.fillchars = {eob = " "} -- hide the tilda on empty lines
--vim.o.backspace = "indent, eol, start" -- better backspace behavior


vim.o.ignorecase = true -- when searching
vim.o.smartcase = true -- when searching ignore unless upper searched
vim.o.hlsearch = true -- highligth searched matches
vim.o.incsearch = true -- show matches as you tipe


vim.o.showmatch = true -- hl matching brackets
vim.o.cmdheight = 1 -- command line height
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.showmode = false

vim.o.pumheight = 15 -- popup menu height
vim.o.pumblend = 10 -- popup menu transparency
vim.o.winblend = 0 -- popum window transparency
vim.o.conceallevel = 0 -- do not hide markup
vim.o.concealcursor = "" -- do not hide cusorline in markup

vim.o.lazyredraw = true -- do not redraw during macros
vim.o.synmaxcol = 300 -- syntax highlighting limit


local undodir = vim.fn.expand("C:\\Users\\fifok\\Appdata\\Local\\nvim\\undodir")
if vim.fn.isdirectory(undodir) == 0
then vim.fn.mkdir(undodir,"p") end

vim.o.undofile = true -- create undo file
vim.o.undodir = undodir -- specify a dir for the undo file(s)

vim.o.backup = false --  have a backup file
vim.o.backup = false --  have a backup file
vim.o.swapfile = false --  create a swap file

vim.o.updatetime = 300 -- faster completion
vim.o.timeoutlen = 1000 -- time out duration
vim.o.ttimeoutlen = 0 -- keycode time out duration
vim.o.autoread  = true -- auto reload changes if out of neovim
vim.o.autowrite = false -- auto save


vim.o.hidden = true -- allow hidden buffers
vim.o.errorbells = false -- error sounds
vim.o.autochdir = false -- do not autochange directories

vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdir in search
vim.o.selection = "inclusive"  -- include char under cursor when selecting
vim.o.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.o.modifiable = true -- allow buffer modifications
vim.o.encoding = "UTF-8"

--folding requires treesitter avalible at runtime if not safe fallback
vim.opt.foldmethod = "expr" -- use expression fro folding
vim.opt.foldlevel = 99 --start with all folds open


vim.splitbelow = true -- newsplit window is bellow (horizontally)
vim.splitright = true -- new split window is on the right (vertically)

vim.o.wildmenu = true -- tab completion
vim.o.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60")
vim.o.redrawtime = 10000 -- icrease neovim redraw tolerance
vim.o.maxmempattern = 20000

vim.o.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

vim.o.autocomplete = true
vim.diagnostic.enable(true)

--  =====================================================
--  ==                   KEYMAPS                       ==
--  =====================================================

vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window/pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window/pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window/pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window/pane" })

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n","gl", vim.diagnostic.open_float,{desc = "open diagnostic"})

vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p"):gsub("/","\\")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

vim.keymap.set("n","<leader>tv", function()
     vim.cmd.vsplit()
     vim.cmd.term()
end,{desc = "new terminal window vertically"})

vim.keymap.set("n","<leader>th", function()
     vim.cmd.split()
     vim.cmd.term()
end,{desc = "new terminal window horizontaly"})

--  =====================================================
--  ==                 AUTO CMDS                       ==
--  =====================================================

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Format on save (ONLY real file buffers, ONLY when efm is attached)
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	pattern = { 
		"*.lua",
		"*.py",
		"*.go",
		"*.js",
		"*.jsx",
		"*.ts",
		"*.tsx",
		"*.json",
		"*.css",
		"*.scss",
		"*.html",
		"*.sh",
		"*.bash",
		"*.zsh",
		"*.c",
		"*.cpp",
		"*.h",
		"*.hpp",
	},
	callback = function(args)
		-- avoid formatting non-file buffers (helps prevent weird write prompts)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end
		if not vim.bo[args.buf].modifiable then
			return
		end
		if vim.api.nvim_buf_get_name(args.buf) == "" then
			return
		end

		local has_efm = false
		for _, c in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
			if c.name == "efm" then
				has_efm = true
				break
			end
		end
		if not has_efm then
			return
		end

		pcall(vim.lsp.buf.format, {
			bufnr = args.buf,
			timeout_ms = 2000,
			filter = function(c)
				return c.name == "efm"
			end,
		})
	end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then -- except in diff mode
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
		local last_line = vim.api.nvim_buf_line_count(0)

		local row = last_pos[1]
		if row < 1 or row > last_line then
            return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd("PackChanged",{callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
        if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
        vim.cmd("TSUpdate")
    end
end})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "python", "INO", "arduino", "json", "c", "cpp", "vimdoc", "markdown" },

    callback = function() vim.treesitter.start()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method("textDocument/Completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf,{autotrigger = true})
        end
    end
})

--  =====================================================
--  ==                   PLUGINS                       ==
--  =====================================================

vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/rebelot/kanagawa.nvim",

    "https://github.com/nvim-treesitter/nvim-treesitter.git",
    "https://github.com/neovim/nvim-lspconfig",

    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",

    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/abecodes/tabout.nvim"
})

require("mini.basics").setup()
require("mini.surround").setup()

require("nvim-treesitter").setup {
    install_dir = vim.fn.stdpath("data") .. "/site"
}
require('nvim-treesitter').install { "lua", "python", "arduino", "json", "vimdoc", "markdown"}

vim.cmd.colorscheme(color_scheme["main"])

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = color_scheme["statusline"], -- horizon is favourite
    component_separators = { left = '', right = ' '},--
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {"filename","branch"},
    lualine_c = {'diagnostics'},
    lualine_x = {"diff", 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require("tabout").setup({ignore_beginning = false})

--  =====================================================
--  ==                     LSP                         ==
--  =====================================================

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "lua_ls",
        "stylua",
        "basedpyright",
        "ruff",
        "arduino-language-server",
        "topiary"
    }
})


--  =====================================================
--  ==                     END                         ==
--  =====================================================

print("hello world!")
