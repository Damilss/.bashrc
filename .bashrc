# User executables
export PATH="$HOME/.local/bin:$PATH"

# Run Claude using the paid Anthropic service
claude-paid() {
    unset ANTHROPIC_API_KEY
    unset ANTHROPIC_BASE_URL
    unset ANTHROPIC_AUTH_TOKEN

    claude "$@"
}

# Run Claude using local Ollama
claude-local() {
    ANTHROPIC_BASE_URL="http://localhost:11434" \
    ANTHROPIC_AUTH_TOKEN="ollama" \
    ANTHROPIC_API_KEY="" \
    claude "$@"
}


# ssh into raspberrypi.local
pi() { 
	ssh emilio@raspberrypi.local;
}

# Colored prompt: username@hostname directory $
PS1='\[\e[35m\]\u@\h\[\e[0m\] \[\e[32m\]\w\[\e[0m\] \$ '

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"

case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Docker
export PATH="$HOME/.docker/bin:$PATH"

# Node version management through fnm
if command -v fnm >/dev/null 2>&1; then
    eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
fi

