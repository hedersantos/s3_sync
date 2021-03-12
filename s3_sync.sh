#! /bin/bash

#-------------------------------------------------------------------------------
# IMPORTANT: 
#
#   AWS CLI must be installed in your computer for this script to run properly.
#
# THIS SCRIPT DOES
#
# synchronize data between the directory it's called and an S3 Bucket. Use one 
# of the options below to set synchronization direction:
#
# --down : FROM S3 Bucket TO local directory
# --up : FROM local directory TO S3 Bucket
#
#-------------------------------------------------------------------------------

function suggest_bucket_prefix {
    #---------------------------------------------------------------------------
    #  Create S3 Bucket prefix suggestion by removing "/home/user" from current
    # working directory name.
    #---------------------------------------------------------------------------

    # notice "1024" upper bound has benn arbitrarily chosen
    local prefix_suggestion=$(pwd | cut -d '/' -f 4-1024)

    # append "prefix_suggestion" variable to s3 bucket name
    echo s3://hsantos-backup/$prefix_suggestion     
}

function prompt_for_user_confirmation {
    #---------------------------------------------------------------------------
    #  Print prepared AWS CLI command to issue and confirm its execution is OK
    # to go ahead.
    #---------------------------------------------------------------------------

    # use loop to query user until expected criteria is met
    while true; do
    
        # prompt user and store reponse in "yn" variable
        read -p "EXECUTE \"$cmd_string\"? (y/n)" yn

        # evaluate "yn" variable contents
        case $yn in
            # affirmative: inform process start and break from while loop
            [Yy]* ) echo 'STARTED sync operation...'; break;;

            # negative: abort and exit shell.
            [Nn]* ) echo 'ABORTED sync operation.'; exit;;

            # catch-all: return to while loop until recognizable answer is given
            * ) echo "Please answer Yes or No.";;
        esac
    done
}

function inform_cmd_line_argument_error {
    #---------------------------------------------------------------------------
    #  Print message to user informing neither "--up" or "--down" command line
    # arguments were detected during script invocation.
    #---------------------------------------------------------------------------
    echo 'ERROR: expecting either "--down" or "--up" as sole command line argument.'
}

#-------------------------------------------------------------------------------
# MAIN process starts here.
#-------------------------------------------------------------------------------

# check whether a single command line argument's been received
if [ $# == 1 ]; then

    # store S3 Bucket prefix suggestion in variable
    prefix_suggestion=$(suggest_bucket_prefix)

    #  Prompt user to confirm S3 Bucket prefix suggestion and store response in
    # "remote_path" variable. Remember:
    # -i specifies default answer
    # -e makes default answer editable 
    read -p "EDIT or press ENTER to confirm S3 location: " -i $prefix_suggestion -e remote_path

    # store local path in variable
    local_path=$(pwd)

    # handle synchronization "directions"
    case $1 in

        # download
        '--down' )
            cmd_string="aws s3 sync $remote_path $local_path"
            # confirm user wants to proceed
            prompt_for_user_confirmation
            # execute sync operation
            aws s3 sync $remote_path $local_path
        ;;

        # upload
        '--up' )
            cmd_string="aws s3 sync $local_path $remote_path"
            # confirm user wants to proceed
            prompt_for_user_confirmation
            # execute sync operation
            aws s3 sync $local_path $remote_path
        ;;

        # unknown (catch-all case)
        * )
            # wrong command line argument received
            inform_cmd_line_argument_error
    esac

else
    # no command line argument received
    inform_cmd_line_argument_error
fi