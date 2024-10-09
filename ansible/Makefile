MAKE = make
ROOT_DIR := $(pwd)
PB_DIR := $(ROOT_DIR)/playbook
PB_INSTALL_DIR := $(PB_DIR)/installation
PB_DEPLOY_DIR := $(PB_DIR)/deploy
ANS_OPTS := -i inventory

help:
	@echo "Available targets:"
	@echo "  drawio              - Run the Draw.io Docker container using Ansible"
	@echo "  jupyter             - Run the Jupyter Notebook Docker container using Ansible"
	@echo "  docker_install      - Install Docker by running the Ansible playbook"
	@echo "  requirements        - Install Ansible Galaxy roles from the requirements file"
	@echo "  run_depends         - Conditionally runs docker_install and requirements if RUN_DOCKER is set"

drawio: run_depends
	@ansible-playbook $(ANS_OPTS) $(PB_DEPLOY_DIR)/drawio.yml

jupyter: run_depends
	@ansible-playbook $(ANS_OPTS) $(PB_DEPLOY_DIR)/jupyter.yml

nginx_install:
	@ansible-playbook $(ANS_OPTS) $(PB_INSTALL_DIR)/nginx.yml

run_depends:
ifneq ($(RUN_DEPENDS), )
	@$(MAKE) requirements
	@$(MAKE) docker_install
endif

requirements:
	@ansible-galaxy install -r requirements.yml

docker_install: requirements
	@ansible-playbook $(ANS_OPTS) $(PB_INSTALL_DIR)/docker.yml

.PHONY: help docker_install drawio jupyter requirements run_depends
