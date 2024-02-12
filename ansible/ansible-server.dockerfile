# Use a imagem oficial do Ubuntu como base
FROM ubuntu:latest

# Atualize os repositórios e instale os pacotes necessários
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    && apt-add-repository --yes --update ppa:ansible/ansible \
    && apt-get install -y ansible sshpass

# Defina a variável de ambiente para evitar problemas com o terminal
ENV ANSIBLE_FORCE_COLOR=true

# Defina o comando padrão para o contêiner
CMD ["/bin/bash"]
