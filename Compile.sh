#!/bin/bash

# Colors
# ----------------------------------------
BL='\e[01;90m' > /dev/null 2>&1; # Black
RE='\e[06;91m' > /dev/null 2>&1; # Red-Error
R='\e[01;91m' > /dev/null  2>&1; # Red
G='\e[01;92m' > /dev/null  2>&1; # Green
Y='\e[01;93m' > /dev/null  2>&1; # Yellow
B='\e[01;94m' > /dev/null  2>&1; # Blue
P='\e[01;95m' > /dev/null  2>&1; # Purple
C='\e[01;96m' > /dev/null  2>&1; # Cyan
LG='\e[01;37m' > /dev/null 2>&1; # Light Gray
N='\e[0m' > /dev/null      2>&1; # Null

# +-----------------------+
# | Colors   | Usage      |
# |:--------:|:----------:|
# | Black    | 0          |
# | L-Gray   | 0          |
# | Cyan     | 0          |
# | Blue     | 0          |
# | Purple   | Color      |
# | Red      | Color      |
# | Green    | Color      |
# | Yellow   | Color      |
# | Red-E    | Error      |
# | Green    | Success    |
# | Null     | De-Color   |
# +-----------------------+

# Divider
# ----------------------------------------
divider="-------------------------------------------------"

# OFox Compiler Header
# ----------------------------------------
echo -e $Y "  @@@@@@  @@@@@@@@  @@@@@@  @@@  @@@     @@@@@@@  @@@@@@  @@@@@@@@@@   @@@@@@@  @@@ @@@     @@@@@@@@ @@@@@@@   " ;sleep 0.2;
echo -e $Y " @@@@@@@@ @@@@@@@@ @@@@@@@@ @@@  @@@    @@@@@@@@ @@@@@@@@ @@@@@@@@@@@  @@@@@@@@ @@@ @@@     @@@@@@@@ @@@@@@@@  " ;sleep 0.2;
echo -e $Y " @@!  @@@ @@!      @@!  @@@ @@!  !@@    !@@      @@!  @@@ @@! @@!  @@! @@!  @@@ @@! @@!     @@!      @@!  @@@  " ;sleep 0.2;
echo -e $Y " !@!  @!@ !@!      !@!  @!@ !@!  @!!    !@!      !@!  @!@ !@! !@!  !@! !@!  @!@ !@! !@!     !@!      !@!  @!@  " ;sleep 0.2;
echo -e $Y " @!@  !@! @!!!:!   @!@  !@!  !@@!@!     !@!      @!@  !@! @!! !!@  @!! !!@@!@!  !!@ @!!     @!!!:!   @!@!!@!   " ;sleep 0.2;
echo -e $Y " !@!  !!! !!!!!:   !@!  !!!   @!!!      !!!      !@!  !!! !@!   !  !@! !!@!!!   !!! !!!     !!!!!:   !!@!@!    " ;sleep 0.2;
echo -e $Y " !!:  !!! !!:      !!:  !!!  !: :!!     :!!      !!:  !!! !!:      !!: !!:      !!: !!:     !!:      !!: :!!   " ;sleep 0.2;
echo -e $Y " :!:  !:! :!:      :!:  !:! :!:  !:!    :!:      :!:  !:! :!:     :!:  :!:      :!: :!:     :!:      :!:  !:!  " ;sleep 0.2;
echo -e $Y " ::::::::  ::      ::::: ::  ::  :::     ::: ::: ::::: :: :::     ::    ::       :: ::!::!  :: ::::  ::   ::   " ;sleep 0.2;
echo -e $Y "  : :  :   :        : :  :   :   ::      :: :: :  : :  :   :      :     :        :   : :: :  : :: ::  :   :    " $N;sleep 0.2;
echo ""

# Welcome
# ----------------------------------------
echo -e $B "Hello, Thank you for using this script" $N;sleep 0.1;
echo -e $Y "You can easily build orange fox with this script for your Device " $N;sleep 0.1;
sleep 5
clear

# Setup
# ----------------------------------------
echo -e $C "Setup the environment" $N;sleep 0.1;
{
	sudo apt install git python aria2 nano -y
	sudo pacman -S git aria2 python nano
}&> /dev/null
clear
echo -n -e $R'              •'$N; sleep 0.3;
echo -n -e $Y'•'$N; sleep 0.4;
echo -n -e $G'•'$N; sleep 0.2;
cd ~/ || return
{
git clone https://gitlab.com/OrangeFox/misc/scripts
}&> /dev/null
cd scripts || return
sudo bash setup/android_build_env.sh
sudo bash setup/install_android_sdk.sh
clear

#Sync
# ----------------------------------------
echo -e $Y " Options
 1 : For Normal device (slow)
 2 : For Dynamic partition device (very very slow)
 -------------------------------------------------------------------------------------------------------------- " $N

read -r Ans4
clear
if [[ "${Ans4}" = 1 ]]; then
	fox=OrangeFox
	echo -e $C "synching the Latest Orange Fox Sources" $N; sleep 0.1;
	echo -n -e $R'              •'$N; sleep 0.3;
	echo -n -e $Y'•'$N; sleep 0.4;
	{
	cd ~/scripts || return
	mkdir Orangefox
	cd Orangefox || return
	repo init --depth=1 -u https://gitlab.com/OrangeFox/Manifest.git -b fox_9.0
	repo sync -j8 --force-sync
	}&> /dev/null
	echo -n -e $G'•'$N
	sleep 2
	clear
	cd ~/scripts/Orangefox || return
elif [[ "${Ans4}" = 2 ]]; then
	fox=OrangeFox_10
	echo -e $C "synching the Latest Orange Fox Sources" $N; sleep 0.1;
	echo -n -e $R'              •'$N; sleep 0.3;
	echo -n -e $Y'•'$N; sleep 0.4;
	{
 	mkdir ~/OrangeFox_10
	cd ~/OrangeFox_10
	rsync rsync://sources.orangefox.download/sources/fox_10.0 . --progress -a
	}&> /dev/null
	echo -n -e $G'•'$
	sleep 2
fi
clear

# Questions
# ----------------------------------------
echo -e $P "Now tell me your device codename" $N; sleep 0.1;
read -r code
echo "$divider"
echo -e $P "Now tell me your device vendor" $N; sleep 0.1;
read -r vendor
echo "$divider"
echo -e $P "Now Give me your trees github link" $N; sleep 0.1;
read -r trees
echo "$divider"
echo -e $P "Now tell me the your name (Username)" $N; sleep 0.1;
read -r main
echo -e $P "Now tell me the version" $N; sleep 0.1;
read -r version
clear

# Clone
# ----------------------------------------
echo -e $C "Cloning to scripts/$fox/device/$vendor/$code" $N; sleep 0.1;
echo -n -e $R'              •'$N; sleep 0.3;
echo -n -e $Y'•'$N; sleep 0.4;
{
	git clone "${trees}" device/"${vendor}"/"${code}"
	clear
}&> /dev/null
echo -n -e $G'•'$N
sleep 2
clear

# Edit Bconfig.mk
# ----------------------------------------
echo -e $LG "If you have to edit the cloned tree (e.g. BoardConfig.mk) do it now." $N; sleep 0.1;
echo -e $P "Press Enter to Continue" $N; sleep 0.1;
read -r Ans
clear

# Environment
# ----------------------------------------
echo -e $C "Now lets start building the environment"
source build/envsetup.sh;sleep 5;
clear

# Configs
# ----------------------------------------
echo -e $Y " Options
 1 : You already have a config file created by this script
 2 : You don't have a config file and now we will create it for you and will use it later when rebuilding Ofox
 -------------------------------------------------------------------------------------------------------------- " $N
read -r Ans3

if [[ "${Ans3}" = 1 ]]; then

elif [[ "${Ans3}" = 2 ]]; then
echo -e $Y "Lets create a config file using our good friend nano for your device var settings.
(https://gitlab.com/OrangeFox/vendor/recovery/-/blob/master/orangefox_build_vars.txt) " $N; sleep 2;
nano ~/OrangeFox-Universal-Compile-Tool/configs/"${code}"_ofconfig
fi
clear

# Import Configs
# ----------------------------------------
echo -e $C "Importing Configs" $N
source ~/OrangeFox-Universal-Compile-Tool/configs/"${code}"_ofconfig; sleep 1;
if [ "$?" != "0" ]; then
  echo -e $RE "Import failed :(" $N
  exit
fi


# Maintainer
# ----------------------------------------
export OF_MAINTAINER="${main}"
# Universal Build Configs
export ALLOW_MISSING_DEPENDENCIES=true
export TW_DEFAULT_LANGUAGE="en"
export USE_CCACHE=1
export FOX_R11=1
export FOX_ADVANCED_SECURITY=1
export FOX_RESET_SETTINGS=1
export FOX_VERSION="${version}"

echo -e $G "Press Enter to Launch 🚀"
echo "$divider"
read -r enter

# Launch
# ----------------------------------------
lunch omni_"${code}"-eng
if [ "$?" != "0" ]; then
  echo -e $RE "Launch failed :(" $N
  exit
fi

# Build
# ----------------------------------------
echo -n -e $G "^-^ Building " $N; sleep 0.1;
echo -n -e $R'              •'$N; sleep 1;
echo -n -e $Y'•'$N; sleep 1;
echo -n -e $G'•'$N; sleep 1;
echo ""
sleep 2
mka recoveryimage

# Credits
# ----------------------------------------
echo ""
echo -e $B " credits :
Do follow my Github Account for more scripts : https://github.com/Sammy970
Do follow me too : https://github.com/gghhkm
Would love to help you - Sammy970
All the best - gghhkm " $N
sleep 3
