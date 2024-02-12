FROM ubuntu:latest

# Instalar o servidor SSH
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# Configurar a senha do usuário root (troque 'sua_senha_ssh' pela senha desejada)
RUN echo 'root:root#123' | chpasswd

# Permitir login root via SSH
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expor a porta SSH
EXPOSE 22

# Iniciar o servidor SSH durante a execução do contêiner
CMD ["/usr/sbin/sshd", "-D"]
