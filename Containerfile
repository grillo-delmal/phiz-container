FROM fedora:38

RUN dnf -y install \
    npm \
    git
RUN npm install -g npm pnpm

WORKDIR /usr/src/phiz

# Get project
RUN git clone https://github.com/SpookyCorgi/phiz.git .
RUN git checkout 0c09ae2

# Remove unneeded parts
ADD pnpm-workspace.yaml .
RUN rm -rf ./app

# Install project deps
RUN pnpm install

WORKDIR /usr/src/phiz/site

# Build project
RUN npm run build

EXPOSE 4173

CMD npm run preview -- --host 0.0.0.0