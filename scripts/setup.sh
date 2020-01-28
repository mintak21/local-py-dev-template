#!/bin/sh
function install_brew() {
    which brew
    if [ $? -ne 0 ]; then
        printf '\033[92m%s\033[m\n' 'start install homebrew'
	    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if [ $? -ne 0 ]; then
            printf '\033[91m%s\033[m\n' 'something error with installing homebrew'
            exit 1
        fi
        brew upgrade
	    printf '\033[36m%s\033[m\n' 'success homebrew installation'
    fi
}

function install_python() {
    which python
    if [ $? -ne 0 ]; then
        brew install python
        if [ $? -ne 0 ]; then
            printf '\033[91m%s\033[m\n' 'something error with installing python'
            exit 1
        fi
        printf '\033[36m%s\033[m\n' 'success python installation'
    fi
}

function install_docker_for_mac() {
    which docker
    if [ $? -ne 0 ]; then
        brew cask install docker
        if [ $? -ne 0 ]; then
            printf '\033[91m%s\033[m\n' 'something error with installing docker'
            exit 1
        fi
        printf '\033[36m%s\033[m\n' 'success docker installation'
        printf '\033[92m%s\033[m\n' 'Wait 2 minutes for booting docker'
        open -a /Applications/Docker.app
        sleep 120s
    fi
}

function install_requirements() {
    install_brew
    install_python
    install_docker_for_mac
}

# main
if [ $# -ne 1 ]; then
    printf '\033[91m%s\033[m\n' 'need Arguments:[1]TargetDir'
    exit 1
fi

TARGET_DIR=$1

if [ ! -e ${TARGET_DIR} ]; then
    mkdir -p ${TARGET_DIR}
fi

install_requirements

# とりあえずFlaskだけ対応するバージョン
cd `dirname $0`
cp -rf ../flask_template/. ${TARGET_DIR}

printf "\033[36m%s\033[m\n" "complete create new project to ${TARGET_DIR}"
