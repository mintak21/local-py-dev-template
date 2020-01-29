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
    if [ $# -lt 2 ]; then
        printf '\033[91m%s\033[m\n' 'need Arguments: [1]TargetDir [2]DeployProjectType(f[flask] or d[django] or j[jupyter])'
        printf '\033[91m%s\033[m\n' 'if your DeploymentProjectType is django, you can specify project_name/[3]Project_name'
        exit 1
    fi

    if [ ! -e ${TARGET_DIR} ]; then
        mkdir -p ${TARGET_DIR}
    fi

    if [ $2 == 'f' ]; then
        TARGET_PJ='flask'
    elif [ $2 == 'j' ]; then
        TARGET_PJ='jupyter'
    elif [ $2 == 'd' ]; then
        TARGET_PJ='django'
        if [ -z "$3" ]; then
            DJANGO_PJ_NAME="mysite"
            printf '\033[92m%s\033[m\n' 'Use Default Django Project Name: mysite'
        else
            DJANGO_PJ_NAME="$3"
        fi
    else
        printf '\033[91m%s\033[m\n' "Unknown Project Type: $2"
        exit 1
    fi
}

function install_local_package() {
    # Flask/Djangoはどうせimportを怒られるので、ローカルにも入れとくものは入れとく
    # cp後の前提
    if [ ${TARGET_PJ} == 'flask' ]; then
        pip install -r ./templates/${TARGET_PJ}/requirements.txt
    elif [ ${TARGET_PJ} == 'django' ]; then
        pip install -r ./templates/${TARGET_PJ}/requirements.txt
        pushd ${TARGET_DIR}/django_project
        django-admin startproject ${DJANGO_PJ_NAME} .
	python manage.py migrate
        if [ $? -ne 0 ]; then
            printf '\033[91m%s\033[m\n' 'failed to create django-project'
            exit 1
        fi
        popd
    fi
}

# main
cd `dirname $0`/..
TARGET_DIR=$1

validate $@
install_requirements

cp -rf ./templates/${TARGET_PJ}/. ${TARGET_DIR}
if [ $? -ne 0 ]; then
    printf '\033[91m%s\033[m\n' 'failed to create project'
fi

install_local_package

printf "\033[36m%s\033[m\n" "complete create new ${TARGET_PJ} project to ${TARGET_DIR}"
