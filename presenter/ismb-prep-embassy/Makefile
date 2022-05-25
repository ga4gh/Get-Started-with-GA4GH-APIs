.PHONY: sync-server
sync-server:
	@scp -i ${KEY_FILE} -r * ${USER}@${SERVER_IP}:${SERVER_PATH}

.PHONY: sync-node1
sync-node1:
	@scp -i ${KEY_FILE} -r * ${USER}@${NODE1_IP}:${NODE1_PATH}

.PHONY: sync-node2
sync-node2:
	@scp -i ${KEY_FILE} -r * ${USER}@${NODE2_IP}:${NODE2_PATH}

.PHONY: sync
sync: sync-server sync-node1 sync-node2

.PHONY: ssh-server
ssh-server:
	@ssh -i ${KEY_FILE} ${USER}@${SERVER_IP}

.PHONY: ssh-node1
ssh-node1:
	@ssh -i ${KEY_FILE} ${USER}@${NODE1_IP}

.PHONY: ssh-node2
ssh-node2:
	@ssh -i ${KEY_FILE} ${USER}@${NODE2_IP}
