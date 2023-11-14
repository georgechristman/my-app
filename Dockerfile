FROM amazonlinux:2023

RUN dnf install -y tar gzip unzip git

# aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# node
RUN . ~/.nvm/nvm.sh && nvm install 18.17.0

RUN echo -e "\
export NVM_DIR=\"\$HOME/.nvm\"\n\
[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"\n\
" >> ~/.bashrc

ENTRYPOINT [ "/bin/bash" ]
