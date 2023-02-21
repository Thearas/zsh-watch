#!/usr/bin/env zsh

ZSH_WATCH=${ZSH_WATCH:-watch}
ZSH_WATCH_FLAGS=${ZSH_WATCH_FLAGS:-"-n1 -t -d"} # Default flags for watch

_zsh_watch_expand_alias() {
    functions[_alias_]=$1
    echo ${functions[_alias_]}
}

_zsh_watch_run() {
    if (( ! $+commands[$ZSH_WATCH] )); then
        echo -e "\033[31mCommand $ZSH_WATCH not found.\033[0m"
        return 1
    fi

    local watch_exec="$commands[$ZSH_WATCH]"
    local watch_flags=() # The flags for watch exec, not for user command

    if [ $# = 0 ]; then
        $watch_exec -h
        return
    fi

    while [[ $# -gt 0 ]]; do
        case "$1" in
        -h | --help)
            $watch_exec -h
            return
            ;;
        -n | --interval)
            watch_flags+=($1)
            watch_flags+=($2)
            shift
            ;;
        -*) watch_flags+=($1) ;;
        *) break ;;
        esac
        shift
    done

    if [ $#watch_flags = 0 ]; then
        watch_flags+=( ${=ZSH_WATCH_FLAGS} )
    fi

    if declare -f -- "$1" >/dev/null 2>&1; then
        echo -e "\033[31mFunctions are not support yet.\033[0m"
        return 1
    fi

    local cmd="$(_zsh_watch_expand_alias $1)"
    local cmd_args="${@:2}"

    if which $1 >&/dev/null; then
        $watch_exec ${watch_flags[*]} $cmd ${cmd_args[*]}
    else
        $watch_exec ${watch_flags[*]} zsh -c \"$cmd ${cmd_args[*]}\"
    fi
}

watch() {
    _zsh_watch_run $@
}
