MAKE=make

help:
	@echo "Available targets:"
	@echo "  drawio              - Run the Draw.io Docker container using Ansible"
	@echo "  jupyter             - Run the Jupyter Notebook Docker container using Ansible"
	@echo "  docker_install      - Install Docker by running the Ansible playbook (if RUN_DOCKER is set)"
	@echo "  requirements        - Install Ansible Galaxy roles from the requirements file (if RUN_DEPENDS is set)"
	@echo "  run_depends         - Conditionally runs docker_install and requirements if RUN_DOCKER is set"

drawio: run_depends
	@ansible-playbook -i inventory playbook/drawio/drawio.yml

jupyter: run_depends
	@ansible-playbook -i inventory playbook/jupyter/jupyter.yml

run_depends:
ifneq ($(RUN_DEPENDS), )
	@$(MAKE) requirements
	@$(MAKE) docker_install
endif

requirements:
	@ansible-galaxy install -r requirements.yml

docker_install: requirements
	@ansible-playbook -i inventory playbook/docker/docker_install.yml

.PHONY: help docker_install drawio jupyter requirements run_depends
