### Setup

1. Backup your existing config (if any):
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this repo:
```bash
git clone git@github.com:username/nvim_config.git ~/.config/nvim
```

3. Open Neovim - plugins will install automatically:
```bash
nvim
```

### Post-install
- LSP servers install on first use via Mason
- Run `:checkhealth` to verify everything works
