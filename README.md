> [Learn Lua in Y minutes](https://learnxinyminutes.com/lua/)

[Default keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)
#### File Conventions

```
~/.config/nvim/
├── init.lua           <-- main configuration file
└── lua/               <-- Lua configuration files
    ├── core/          <-- Basic settings and essential functions
    │   ├── options.lua    <-- Neovim general settings (e.g., line numbers, tab size)
    │   ├── keymaps.lua    <-- Keyboard shortcuts
    │   └── autocommands.lua <-- Actions that happen automatically (e.g., on file save)
    └── plugins/       <-- Configuration for all installed plugins
        ├── lsp.lua        <-- Language Server Protocol (LSP) settings
        ├── cmp.lua        <-- Completion engine (like auto-suggest)
        ├── treesitter.lua <-- Syntax highlighting and parsing
        ├── telescope.lua  <-- Fuzzy finder (for quick file/text search)
        └── (other_plugins).lua <-- Each plugin gets its own file
```

---
#### Commands
`:help` -> opens help menu of neovim
`:Tutor` -> opens tutoral doc for Neovim tutorial
`:checkhealth` -> neovim health check command 

---
#### Navigating the help docs
-  use `ctrl + ]` to open the hyperlink
-  use `ctrl + t` to go to previous location 
-  use `ctrl + o` to go to previous location
---
#### Plugins 

- **`lazy.nvim `** - a neovim plugin manager
- **`telescope`** - A search tool for files and live grep. Uses fuzzy finder under the hood.
- **treesitter** - a parser generator tool which creates syntax trees for code
- **`auto-cmp`**- an auto complete engine
- **`nvim-lsp`** -
- **`mason`** - a external tool package manager (eg: lsp servers,linters ,formatters ...)

--- 
#### Keybindings 

- `vim.g` -> this is global settings 
- `vim.keymap` -> for creating keyboard shortcuts

---
### Keybinds Tmux 

- `<ctrl+b> + [` -> enter into copy mode
- `ctrl + space` | `use vim keys`  -> to copy text 
- `<ctrl+b> + ]` -> paste copied text

---
