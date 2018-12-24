#! /bin/bash

DIR=$(cd `dirname $0` && pwd)

ln -sf $DIR/bash/profile ~/.bash_profile
ln -sf $DIR/git/gitconfig ~/.gitconfig
ln -sf $DIR/git/git-completion.bash ~/git-completion.bash

read -p 'Which git config do you want to set up? (work|personal): ' configinput

config=work
if [ "$configinput" = "personal" ]
then
    config=personal
fi

ln -sf $DIR/git/included/$config ~/.gitconfig.included

printf "\nSetup $config git configuration:\n"

cat ~/.gitconfig.included

# source the new files
. ~/.bash_profile
