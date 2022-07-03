# docker pull shokinn/docker-alpine-desktop:latest
mkdir -p $HOME/Container/alpine-desktop/config
mkdir -p $HOME/Container/alpine-desktop/media
mkdir -p $HOME/Container/alpine-desktop/nix

docker run -d --name=alpine-desktop \
-v $HOME/Container/alpine-desktop/config:/config \
-v $HOME/Container/alpine-desktop/media:/media \
-v $HOME/Container/alpine-desktop/nix:/nix \
-e GROUP_ID=$GID \
-e USER_ID=$UID \
-e TZ=Europe/Berlin \
-e RCLONE_CONFIG_REMOTE=plexdrive_crypt \
--cap-add SYS_ADMIN \
--device /dev/fuse \
--shm-size 2g \
-p 5800:5800 \
-p 5900:5900 \
shokinn/docker-alpine-desktop:latest