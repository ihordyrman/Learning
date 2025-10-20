# https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html
docker build . -t dyrman/security-essentials

# run as non-root user
docker run -u ihor -it --rm dyrman/security-essentials /bin/bash

# with no new privileges
docker run -u ihor --security-opt=no-new-privileges -it --rm dyrman/security-essentials /bin/bash

# capabilities (drop all, add network admin)
docker run --cap-drop ALL --cap-add NET_ADMIN -u ihor -it --rm dyrman/security-essentials /bin/bash

# read only filesystem (even for root)
docker run --read-only -u ihor -it --rm dyrman/security-essentials /bin/bash

# read only + temporary filesystem (tmpfs) for /tmp with noexec and nosuid options
docker run --read-only --tmpfs /tmp:rw,noexec,nosuid,size=65536k -u ihor -it --rm dyrman/security-essentials /bin/bash

# network

# containers on that specific bridge network are isolated and cannot communicate with each other
# communication is only allowed if explicitly enabled through linking
docker network create --driver bridge -o "com.docker.network.bridge.enable_icc=false" secure-net
docker run -it --rm --network secure-net dyrman/security-essentials /bin/bash 
docker run -it --rm --network secure-net dyrman/security-essentials /bin/bash 
# try ping ip from another container

