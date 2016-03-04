function cdcode(){
    path_list=$(ls -d ~/work/code/*)
    module_list=()
    for i in ${#path_list[@]}
    do
        dir_name=${path_list[(( $i - 1 ))]}
        module_list[(( $i - 1 ))]=${dir_name##*/}
    done

}
