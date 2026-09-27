## Dependencies

tree-sitter-cli needed

## init.lua changes

must change init.lua undodir path based on os

windows: C:\\Users\\fifok\\AppData\\Local\\nvim\\undodir

linux: /home/filpos/.config/nvim/undodir

in \<leader>pa keymap delete :gsub("/","\\") if using linux
