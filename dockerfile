FROM kalilinux/kali-rolling
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt -y install kali-linux-large
RUN apt -y install kali-desktop-kde
RUN apt -y install tigervnc-* # install vnc 
RUN apt -y install sudo nano htop sshfs # install other tools
RUN useradd -mG sudo -s /bin/bash user
ARG password=password
RUN echo "$password\n$password" | passwd root
RUN echo "$password\n$password" | passwd user
RUN echo "$password\n$password" | vncpasswd # set vnc password for "root"
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY main.sh /main.sh
RUN chmod +x /main.sh
USER user
RUN echo "$password\n$password" | vncpasswd # set vnc password for "user"
ENTRYPOINT ["/main.sh"]