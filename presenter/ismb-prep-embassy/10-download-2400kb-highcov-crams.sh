scp \
    -i ${KEY_FILE} \
    ${USER}@${SERVER_IP}:/scratch/data/2400kb/*cram* \
    downsampled-highcov/
