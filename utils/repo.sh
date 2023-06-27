function repo {
    REPOS="$HOME/github"

    # Directory to be used in the session
    DIR_NAME=$1
    if [ -z "$DIR_NAME" ]; then
        echo "Usage: $0 directory-name"
        return 1
    fi

    # Check if session is already opened
    tmux has-session -t "$DIR_NAME" 2> /dev/null
    if [ $? -eq 0 ]; then
        [ -n "$TMUX" ] && tmux switch -t "$DIR_NAME" \
                       || tmux attach-session -t "$DIR_NAME"
        return 0
    fi

    # Session is not opened already
    # Finding path to directory
    DIR_PATH=$(find "$REPOS" -maxdepth 4 -type d -path '*/.*' -prune -o -not -name '.*' \
                    -type d -name "$DIR_NAME" -print)
    echo $DIR_PATH

    # Directory doesn't exist
    if [ -z "$DIR_PATH" ]; then
        echo "Directory: $DIR_NAME not found"
        return 1
    fi

    if [ -n "$TMUX" ]; then
        tmux new-session -s "$DIR_NAME" -c "$DIR_PATH" -d
        tmux switch -t "$DIR_NAME"
    else
        tmux new-session -s "$DIR_NAME" -c "$DIR_PATH"
    fi
}
