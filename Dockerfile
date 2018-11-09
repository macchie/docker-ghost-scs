# using ghost version 2
FROM ghost:2

# set ghost folder as workdir
WORKDIR /var/lib/ghost

# create storage adapters folder
RUN mkdir -p ./content.orig/adapters/storage

# install ghost-digitalocean npm package
# https://github.com/shiva-hack/ghost-digitalocean
RUN npm install ghost-digitalocean && \
    cp -r ./node_modules/ghost-digitalocean \
    ./content.orig/adapters/storage/digitalocean

# install ghost-storage-adapter-s3 npm package
# https://github.com/colinmeinke/ghost-storage-adapter-s3
RUN npm install ghost-s3-storage-adapter && \
    cp -r ./node_modules/ghost-s3-storage-adapter \
    ./content.orig/adapters/storage/s3