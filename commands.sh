function cmd () { 
    if [ "$STATE" = "DEBUG" ]; then
        echo "$@"
    elif [ "$STATE" = "VERBOSE" ]; then
        echo "Running: $@"
        $@
    fi
}

# register takes a file and a location
function register () {
    file=$(readlink -f $2)
    config_file=$(realpath $1)
    if [ "$config_file" = "$file" ]; then
        printf "%s already installed...\n" $1
    else
        if [ -f $2 ]; then
            printf "%s already exists.. backing up\n" $2
            backup $2
        fi 
         cmd ln -s $config_file $2
    fi
}

# clone a repo from github
function github () { 
    url="https://github.com/${1}.git"
    if [ -d $2 ]; then 
        printf "%s exists.. updates\n" $2
        cmd pushd $2
        cmd git pull
        cmd popd
    else 
        cmd git clone $url $2 
    fi 
}

# backups the file
function backup () {
    new_name="$1.old"
    x=0 
    while [ -f $new_name ]; do
        let x+=1;
        new_name="$1.old$x"
    done
    printf "Moving %s to %s\n" $1 $new_name
    cmd mv $1 $new_name
}
