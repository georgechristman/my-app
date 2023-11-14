FROM amazonlinux:2023

RUN dnf install -y tar gzip unzip git


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install


RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash


RUN echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.bashrc && \
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $HOME/.bashrc && \
    . $HOME/.nvm/nvm.sh && \
    nvm install 18.18.2 && \
    npm install -g @aws-amplify/cli


ENTRYPOINT [ "/bin/bash", "--login" ]