# WATCH

Simple `watch` wrapper for zsh that **supports alias and completion.**

## Installation

1. Install `watch` and clone this repo to your zsh custom plugins directory.

    ```bash
    brew install watch
    git clone https://github.com/Thearas/zsh-watch ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-watch
    ```

2. Add `zsh-watch` to the plugins array in your zshrc file.

    ```bash
    plugins=(... zsh-watch)
    ```

## Usage

Just `watch <command> <args>`.

```bash
# Watch the pods, press <Tab> to complete
watch kubectl get pod -n kube-system

# Use alias
watch kgpn kube-system

# Help
watch -h
```

## Use another `watch` command

Use [viddy](https://github.com/sachaos/viddy) instead of `watch`:

```bash
# In your ~/.zshrc
export WATCH=viddy
```
