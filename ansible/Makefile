INVENTORY=inventory
REQ_FILE=requirements.yml

docker_install: requirements
	@ansible-playbook -i ${INVENTORY} install_docker_pb.yml

drawio: docker_install requirements
	@ansible-playbook -i ${INVENTORY} run_drawio_docker_pb.yml

requirements:
	@ansible-galaxy install -r ${REQ_FILE}
