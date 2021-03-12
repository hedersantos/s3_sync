#! /bin/bash

# IMPORTANT: "aws cli" must be installed in your computer for this script to run
#
# THIS script synchronizes data within the directory it's called and an S3 Bucket.
# Use one of the options below to set synchronization direction:
#
# --down : FROM S3 Bucket TO local directory
#
# --up : FROM local directory TO S3 Bucket

if [ $# == 1 ]; then

    # store local path in variable
    local_path=$(pwd)

    # create variable removing '/home/user/' from current working directory
    remote_suffix=$(pwd | cut -d '/' -f4-512)
    # append "remote_suffix" variable to s3 bucket name
    remote_path=s3://hsantos-backup/$remote_suffix

    # handle syncronization
    case $1 in

        '--down')
            echo 'down'

            echo 'aws s3 sync $remote_path $local_path'
        ;;

        '--up')
            echo 'up'

            echo 'aws s3 sync $local_path $remote_path'
        ;;

        *)
            echo 'INFO: unknown argument received.'
    esac

else
    echo 'ERROR: expecting either "--down" or "--up" as sole command line argument.'
fi