# WATCH

Simple `watch` wrapper for zsh that **supports alias and completion.**

## Usage

Just `watch <command> <args>` (press `<Tab>` to complete):

```bash
# Watch the pods
watch kubectl get pod -n kube-system

# Use alias
watch kgpn kube-system

# With watch flags
watch -c -n1 -d -t kgp
```

## Installation

1. Install `watch` (macOS only).

    ```bash
    brew install watch
    ```

2. Add `zsh-watch` to the plugins array in your zshrc file.


    - Oh-My-Zsh

        ```bash
        git clone https://github.com/Thearas/zsh-watch ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-watch

        # In your ~/.zshrc
        plugins=(... zsh-watch)
        ```

    - Zinit

        ```bash
        # In your ~/.zshrc
        zinit light Thearas/zsh-watch
        ```

    - Zi

        ```bash
        # In your ~/.zshrc
        zi light Thearas/zsh-watch
        ```

    - Manual

        ```bash
        git clone https://github.com/Thearas/zsh-watch ~/path/to/zsh-watch

        # In your ~/.zshrc
        source ~/path/to/zsh-watch/zsh-watch.plugin.zsh
        ```

## Use another `watch` command

Use [viddy](https://github.com/sachaos/viddy) instead of `watch`:

```bash
# In your ~/.zshrc
export ZSH_WATCH=viddy
export ZSH_WATCH_FLAGS="-t -d -n1 --pty"
```
