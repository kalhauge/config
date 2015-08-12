function cmd () { 
    if [ "$STATE" = "DEBUG" ]; then
        echo "$@"
    elif [ "$STATE" = "VERBOSE" ]; then
        echo "Running: $@"
        $@
    else 
        $@ &> /dev/null
    fi
}

function debugf () {
    if [ "$STATE" = "DEBUG" ]; then
        printf "$@"
    elif [ "$STATE" = "VERBOSE" ]; then
        printf "$@"
    fi
}

# register takes a file and a location
function register () {
    file=$(readlink -f $2)
    config_file=$(realpath $1)
    if [ "$config_file" = "$file" ]; then
        printf "+ %s\n" $1
        debugf "%s already installed...\n" $1
    else
        printf "x %s\n" $1
        if [ -f $2 ]; then
            debugf "%s already exists.. backing up\n" $2
            backup $2
        elif [ -h $2 ]; then
            debugf "%s already is a symlink.. removing\n" $2
            cmd rm $2    
        fi 
        cmd ln -s $config_file $2
    fi
}

function register_all () {
    target=$(readlink -f $2)
    source_folder=$(realpath $1)

    if [ -d $source_folder ]; then
        if [ ! -d $target ]; then
            cmd mkdir -p $target
        fi
        
        printf ">> %s\n" $1
        for file in $(ls $source_folder); do
            register $source_folder/$file $target/$file
        done
        printf "<< %s\n" $1
    fi
}

# clone a repo from github
function github () { 
    url="https://github.com/${1}.git"
    if [ -d $2 ]; then 
        printf "+ %s\n" $1
        debugf "%s exists.. updates\n" $2
        pushd $2 &> /dev/null
        cmd git pull
        popd &> /dev/null
    else 
        printf "x %s\n" $1
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
    debugf "Moving %s to %s\n" $1 $new_name
    cmd mv $1 $new_name
}
