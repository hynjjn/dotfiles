# ~/dotfiles/my_aliases.zsh

# --- Aliases ---
alias c="clear"
alias h="history"
alias ..="cd .."
alias pg="cd ~/dev/hj-playground"
alias alg="cd ~/dev/AlgorithmStudy"
alias dev="cd ~/dev && l"
alias rsh="source ~/.zshrc"
alias l="ls -lah"
alias diskpart="lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL"
alias ff="fastfetch"

# npm
alias nd="npm run dev"
alias ni="npm install"
alias nb="npm run build"
alias ns="npm start"

# --- Functions ---
cpprun() {
    local file=$1
    local out="${file%.*}.out"
    g++ "$file" -o "$out" && ./"$out"
}

gitpush() {
    git add .
    git commit -m "$*"
    git push
}

