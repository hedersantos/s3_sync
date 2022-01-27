# s3_sync

## About `s3_sync`  

Synchronize entire folders from local machine to a given AWS S3 Bucket.  

Feel free to contribute and suggest improvements to it.  

### Prerequisites  

This function leverages AWS CLI's functionality to simplify synchronizing folders  
to S3 Buckets. Install AWS CLI before attempting to use this function.  

### Usage Examples

#### Uploading `~/Pictures/pets` folder to the Cloud: sync upwards  

```bash
# go into the folder you want to sync
cd ~/Pictures/pets

# invoke helper function
$ s3_sync --up

# prompt: function appends path to current folder* to S3 bucket env var
EDIT or press ENTER to confirm S3 location: s3://bucket-name/Pictures/pets

# prompt: user confirms whether AWS CLI command should be executed
EXECUTE "aws s3 sync /home/john/Pictures/pets s3://bucket-name/Pictures/pets"? (y/n) 

# upload process begins: AWS CLI output follows
STARTED sync operation...
```

Imagine now you add or update files hosted in this S3 bucket.

#### Fetching new and changed files from the Cloud: sync downwards  

```bash
# go into the folder you want to sync
cd ~/Pictures/pets

# invoke helper function
$ s3_sync --down

# prompt: confirm S3 "path" from which to fetch data
EDIT or press ENTER to confirm S3 location: s3://bucket-name/Pictures/pets

# prompt: confirm AWS CLI command to be issued
EXECUTE "aws s3 sync s3://bucket-name/Pictures/pets /home/john/Pictures/pets"? (y/n) y

# download process begins: AWS CLI output follows
STARTED sync operation...
```

### Function setup  

`s3_sync` expects an environment variable called `S3_SYNC_BUCKET_NAME` pointing  
to the S3 Bucket where your data will be stored.  
To add this on Ubuntu, edit the `s3_sync_bucket_name.sh` script and copy it to  
`/etc/profile.d` directory.  

Then add the function below to your `~/.bashrc` or `~/.zshrc` file:  

**REMEMBER** to change `path_to_repo` with the path where you cloned this repo.

```bash 
# s3_sync  
function s3_sync () {  
    # check whether script exists  
    if [ -e $HOME/path_to_repo/s3_sync/s3_sync.sh ]  
    # execute script and pass all arguments to it  
    then bash $HOME/path_to_repo/s3_sync/s3_sync.sh $@  
    fi  
}
```

*suggested reads:*  

* [`bash read` with default answer](<https://superuser.com/questions/835824/use-read-in-bash-script-with-a-standard-answer>)  
* [`WSL2` file explorer access](<https://devblogs.microsoft.com/commandline/access-linux-filesystems-in-windows-and-wsl-2/>)  
* [`bash` prompt Yes/No/Cancel](<https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script>)  
* [`bash` prompt for user confirmation](<https://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script>)  
* [`aws cli` check prefix existence](<https://stackoverflow.com/questions/56961533/is-there-a-way-to-check-if-folder-exists-in-s3-using-aws-cli>)  
* [`.bashrc` file usage](<https://unix.stackexchange.com/questions/129143/what-is-the-purpose-of-bashrc-and-how-does-it-work>)  
* [bash aliases and functions tutorial](<https://opensource.com/article/19/7/bash-aliases>)  
* [`bash $* vs $@`](<https://unix.stackexchange.com/questions/129072/whats-the-difference-between-and>)  
* [invoke shell script from `~/.bashrc` file](<https://askubuntu.com/questions/767842/how-can-i-run-a-shell-script-from-bashrc-file>)  
* [Removing characters from string in `bash`](<https://linuxhint.com/remove_characters_string_bash/>)  
* [Can't find `.bash_profile` in Ubuntu](<https://askubuntu.com/questions/510709/i-cannot-find-bash-profile-in-ubuntu>)  
* [`.bash_profile` vs `.profile`](<https://superuser.com/questions/171035/profile-or-bash-profile>)  
* [bash conditional expressions](<https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html>)  
* [`/etc/profile.d` scripts execution](<https://serverfault.com/questions/434321/when-are-scripts-inside-etc-profile-d-executed>)