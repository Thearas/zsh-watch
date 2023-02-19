WATCH=${WATCH:-watch}

_watch_expand_alias() {
    functions[_alias_]=$1
    echo ${functions[_alias_]}
}

_watch_run() {
    if (( ! $+commands[$WATCH] )); then
        if [ $WATCH = "watch" ]; then
            echo -e '\033[31mCommand watch not found. Please install: `brew install watch`.\033[0m'
        else
            echo -e "\033[31mCommand $WATCH not found.\033[0m"
        fi
        return 1
    fi

    local watch_exec=$(type -p $WATCH | cut -d' ' -f 3-)
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

    if [ ${#watch_flags[@]} = 0 ]; then
        watch_flags+=(-n1 -t -d)
    fi

    if declare -f -- "$1" >/dev/null 2>&1; then
        echo -e "\033[31mFunctions are not support yet.\033[0m"
        return 1
    fi

    local cmd="$(_watch_expand_alias $1)"
    local cmd_args="${@:2}"

    if which $1 >&/dev/null; then
        $watch_exec ${watch_flags[*]} $cmd ${cmd_args[*]}
    else
        $watch_exec ${watch_flags[*]} zsh -c \"$cmd ${cmd_args[*]}\"
    fi
}

watch() {
    _watch_run $@
}
