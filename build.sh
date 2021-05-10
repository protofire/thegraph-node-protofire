#/bin/bash

# Created by Braian Leiva | Protofire

git clone https://github.com/graphprotocol/graph-node.git
cd graph-node
git checkout v0.22.0

cat <<EOF >> docker/Dockerfile
# Configure npm and yarn
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install apt packages
RUN apt-get update && apt-get install -y nodejs yarn vim

# Install npm packages
RUN yarn global add @graphprotocol/graph-cli@v0.20.0
RUN yarn global add @graphprotocol/indexer-cli@v0.13.0

# Create symbolic link
RUN ln -s /usr/local/share/.config/yarn/global/node_modules/@graphprotocol/indexer-cli/bin/graph-indexer /usr/local/share/.config/yarn/global/node_modules/.bin/graph-indexer
RUN echo 'export PATH="\$PATH:/usr/local/share/.config/yarn/global/node_modules/.bin"' >> /etc/bash.bashrc
EOF

docker build -t graph-node-protofire -f docker/Dockerfile .
