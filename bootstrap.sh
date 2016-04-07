#!/bin/bash
# set -e # Exit on error

function main() {
  printf "The ${Red}best${NC} way to ${Red}predict${NC} the future is to ${Red}invent it${NC}. -- ${Purple}Alan Kay${NC}\n"
  printLogo

  setupWorkingDir
  setupBuildTools
  setupPackageManager
  setupTextEditor
}



Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Orange='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Gray='\033[0;37m'

DarkGray='\033[1;30m'
LightRed='\033[1;31m'
LightGreen='\033[1;32m'
Yellow='\033[1;33m'
LightBlue='\033[1;34m'
LightPurple='\033[1;35m'
LightCyan='\033[1;36m'
White='\033[1;37m'
NC='\033[0m' # No Color

ENV_DIR=~/MightyEnv
LOGS_DIR=$ENV_DIR/logs
REPO_DIR=$ENV_DIR/repository
VIM_REPO_DIR=$REPO_DIR/vim

BuildTools=xcode-select


function info() {
  printf "${LightBlue}INFO: $1${NC}\n"
}

function success() {
  printf "${Green}OK: $1${NC}\n"
}

function warrning() {
  printf "${Orange}WARNING: $1${NC}\n"
}

function error() {
  printf "${Red}ERROR: $1${NC}\n"
}

function printLogo() {
cat << "EOF"
 _______ __         __     __                              
|   |   |__|.-----.|  |--.|  |_.--.--.  .-----.-----.--.--.
|       |  ||  _  ||     ||   _|  |  |__|  -__|     |  |  |
|__|_|__|__||___  ||__|__||____|___  |__|_____|__|__|\___/ 
            |_____|            |_____|                   
EOF
}

function setupWorkingDir() {
  info "Setting working dir ~/MightyEnv"
  success "Setting working dir ~/MightyEnv"
  error "Setting working dir ~/MightyEnv"
  warrning "Setting working dir ~/MightyEnv"
  mkdir -p $ENV_DIR
  mkdir -p $LOGS_DIR
  mkdir -p $REPO_DIR
}


function setupBuildTools() {
  if [ -L gcc ]; then
    info "Instaling Command Line tools"
     $BuildTools --install
  fi
}

function setupPackageManager() {
  if [ -L brew ]; then
    echo Instaling Brew
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi
  echo Updating Brew
  brew doctor > $LOGS_DIR/brew.log
  brew update >> $LOGS_DIR/brew.log
}

function setupTextEditor() {
  echo Setting up vim
  if [ -d "vim" ]; then
    echo Pulling vim source
    cd vim
    cd $VIM_REPO_DIR
    if git diff-index --quiet HEAD --; then
      git pull >> $LOGS_DIR/git.log
    else
      git stash; git pull; git stash pop >> $LOGS_DIR/git.log
    fi
  else
    echo Cloning vim
    git clone https://github.com/vim/vim.git >> $LOGS_DIR/git.log
    cd $VIM_REPO_DIR
  fi

  cd src
  if [ -a "$VIM_REPO_DIR/auto/config.mk" ]; then
    echo Building vim
    make distclean >> $LOGS_DIR/vim.log
  fi

  echo Building vim from source
  make >> $LOGS_DIR/vim.log
  make install  >> $LOGS_DIR/vim.log
}

main "$@"

