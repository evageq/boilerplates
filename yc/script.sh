yc compute instance create \
    --name server-1 \
    --hostname server-1 \
    --zone ru-central1-a \
    --create-boot-disk image-family=ubuntu-2004-lts,size=30,type=network-hdd \
    --image-folder-id standard-images \
    --memory 4 --cores 2 --core-fraction 20 \
    --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
    --metadata-from-file user-data=/home/evage/boilerplates/yc/yc_meta_ssh.yml \
    --async
