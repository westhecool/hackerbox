FROM kalilinux/kali-rolling
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt -y install kali-linux-core
RUN apt -y install kali-desktop-kde
RUN apt -y install tigervnc-* # install vnc 
RUN apt -y install sudo nano htop sshfs console-setup # install other tools
RUN useradd -mG sudo -s /bin/bash user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY main.sh /main.sh
RUN chmod +x /main.sh
USER user
ENTRYPOINT ["/main.sh"]