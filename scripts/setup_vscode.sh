#!/bin/sh

function install_extensions() {
	code --install-extension CoenraadS.bracket-pair-colorizer # カギカッコの対応を見やすくする
	code --install-extension davidhouchin.whitespace-plus     # タブとスペースの可視化
	code --install-extension ms-azuretools.vscode-docker      # vscodeでdockerを扱う
	code --install-extension vscode-icons-team.vscode-icons   # アイコンを見やすく
	code --install-extension ms-python.python                 # Pythonを扱う
	printf '\033[36m%s\033[m\n' 'success extensions installation'
}

function install_python_recommended() {
	pip install autopep8
	pip install flake8
	pip install isort
	pip install mypy
	pip install pytest
}

which code
if [ $? -ne 0 ]; then
	printf '\033[91m%s\033[m\n' 'cannot find vs-code, start installation.'
	# インストール済みでもエラーにはならない
    brew cask install visual-studio-code
	# リンクも張る
	ln -fnsv /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin
	printf '\033[36m%s\033[m\n' 'success vs-code installation'
fi

install_python_recommended
install_extensions
