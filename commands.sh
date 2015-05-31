
# register takes a file and a location
function register () {
    if [ -f $2 ]; then
        printf "%s already exists.. backing up\n" $2
        backup $2
    fi
    ln -s $(realpath $1) $2
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
    mv $1 $new_name
}
