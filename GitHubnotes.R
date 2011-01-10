#########################################################
#            Initial GitHub Setup and Use               #
#########################################################


#These lines of code only need to be run once, and they need to be copied/pasted
#into the console (RStudio has issues if you try and do this with the run button)

!git config --global user.name "_______________"
!git config --global user.email "_________@_________"
!git config --global push.default matching


#Copy and paste the results of this command into the SSH Public Keys tab of
#the account settings page within GitHub. Then you should be able to access
#the GitHub repository within RStudio using the following command:

!git clone git@github.com:holschun/Spatially_Weighted_Regression.git

#Then the standard GitHub commands can be used to check out code,
#but each command must be prefaced with an "!". For example, if your working
#directory in RStudio is your repository folder, the commands used would be:

!git pull
#for pulling down new files or changes to the repository

!git status
#to see what local changes/additions have been made to the repository

!git add [name of file]
#to add a newly created local file to the repository

!git commit -a --message "_____________"
#to validate and comment on any changes to files previous to updating the repository
#You must put the contents of your commit within quotes and after the message tag,
#because RStudio is unable to open VI

!git push
#to push back all changes made after commit-ing
