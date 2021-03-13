# s3_sync

## This README file

## About `s3_sync`  

### Function setup  

`s3_sync` expects an environment variable called `S3_SYNC_BUCKET_NAME` pointing  
to the S3 Bucket where your data will be stored.  
To add this on Ubuntu, edit the `s3_sync_bucket_name.sh` script and copy it to  
`/etc/profile.d` directory.  

Then add the function below to your `~/.bashrc` file:  

> \# s3_sync  
function s3_sync () {  
&nbsp;&nbsp;&nbsp;&nbsp;# check whether script exists  
&nbsp;&nbsp;&nbsp;&nbsp;if [ -e $HOME/path_to_repo/s3_sync/s3_sync.sh ]  
&nbsp;&nbsp;&nbsp;&nbsp;# execute script and pass all arguments to it  
&nbsp;&nbsp;&nbsp;&nbsp;then bash $HOME/path_to_repo/s3_sync/s3_sync.sh $@  
&nbsp;&nbsp;&nbsp;&nbsp;fi  
}

### Ideas  

* use `S3 Standard - Infrequent Access` storage class to reduce costs;
* set backup S3 Bucket as environment variable;
* add script to `.bashrc` file for convenience;

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

* [](<>)  

* [](<>)  