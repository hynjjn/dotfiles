# chezmoi
```bash
# for public repo
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply hynjjn

# for private repo
sh -c "$(curl -fsLS get.chezmoi.io)"
./bin/chezmoi init --apply git@github.com:hynjjn/dotfiles.git
```
