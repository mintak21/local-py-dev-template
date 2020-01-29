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

function validate() {
    if [ $# -ne 2 ]; then
    printf '\033[91m%s\033[m\n' 'need Arguments: [1]TargetDir [2]DeployProjectType'
    exit 1
    fi

    if [ ! -e ${TARGET_DIR} ]; then
        mkdir -p ${TARGET_DIR}
    fi

    if [ $2 == 'flask' ]; then
        TARGET_PJ='flask'
    elif [ $2 == 'jupyter' ]; then
        TARGET_PJ='jupyter'
    elif [ $2 == 'django' ]; then
        TARGET_PJ='django'
    else
        printf '\033[91m%s\033[m\n' "Unknown Project Type: $2"
        exit 1
    fi
}

# main
TARGET_DIR=$1

validate $@
install_requirements

cd `dirname $0`
cp -rf ../templates/${TARGET_PJ}/. ${TARGET_DIR}
if [ $? -ne 0 ]; then
    printf '\033[91m%s\033[m\n' 'failed to create project'
fi
printf "\033[36m%s\033[m\n" "complete create new ${TARGET_PJ} project to ${TARGET_DIR}"
