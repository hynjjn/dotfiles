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
alias gs='git status'
alias ls='ls --color=auto'

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

# incognito: requires docker images saved locally
incognito() {
    local os_type=$1
    local custom_name=${2:-temp-session}

    case "$os_type" in
        ubuntu|debian|fedora|arch)
            echo "Starting incognito $os_type session as '$custom_name'..."
            docker run -it --rm --name "$custom_name" "my-$os_type"
            ;;
        *)
            echo "Error: OS '$os_type' not found."
            echo "Usage: incognito [ubuntu|debian|fedora|arch] [name]"
            ;;
    esac
}

chezmoitest() {
    echo "Starting incognito chezmoi-test session..."
    docker run -it --rm --name "chezmoi-test" chezmoi-test
}

