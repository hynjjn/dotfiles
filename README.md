# chezmoi
```bash
# for public repo
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply hynjjn

# for private repo
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply git@github.com:hynjjn/dotfiles.git
```
