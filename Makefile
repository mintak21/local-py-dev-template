SCRIPTS_DIR = scripts
# default_value
TARGET_DIR = ~/workspace/project
DJANGO_PJ_NAME = mysite

.PHONY: create_django_pj create_flask_pj create_jupyter_pj setup_vscode

create_django_pj:
	sh ${SCRIPTS_DIR}/setup.sh ${TARGET_DIR} django ${DJANGO_PJ_NAME}

create_flask_pj:
	sh ${SCRIPTS_DIR}/setup.sh ${TARGET_DIR} flask

create_jupyter_pj:
	sh ${SCRIPTS_DIR}/setup.sh ${TARGET_DIR} jupyter

setup_vscode:
	sh ${SCRIPTS_DIR}/setup_vscode.sh
