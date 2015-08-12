
# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT=$1
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM=$2
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG=$3
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL=$4

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
    # Get the last commit.
    last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
    if [[ -n "$last_commit" ]]; then
        now=`date +%s`
        seconds_since_last_commit=$((now-last_commit))

        # Totals
        MINUTES=$((seconds_since_last_commit / 60))
        HOURS=$((seconds_since_last_commit/3600))

        # Sub-hours and sub-minutes
        DAYS=$((seconds_since_last_commit / 86400))
        SUB_HOURS=$((HOURS % 24))
        SUB_MINUTES=$((MINUTES % 60))

        if [[ -n $(parse_git_dirty) ]]; then
            if [ "$MINUTES" -gt 30 ]; then
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
            elif [ "$MINUTES" -gt 10 ]; then
                COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
            fi
        else
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
        fi
        
        if [ "$HOURS" -gt 24 ]; then
            echo "$COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m"
        elif [ "$MINUTES" -gt 60 ]; then
            echo "$COLOR${HOURS}h${SUB_MINUTES}m"
        else
            echo "$COLOR${MINUTES}m"
        fi
    fi
}
