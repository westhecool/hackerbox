FROM kalilinux/kali-rolling
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt -y install kali-linux-large
RUN apt -y install kali-desktop-kde
RUN apt -y install tigervnc-* sudo nano htop
RUN echo "password\npassword" | passwd root
RUN useradd -mG sudo -s /bin/bash user
RUN echo "password\npassword" | passwd user
USER user
CMD ["tigervncserver", "-fg", "-localhost", "no", "-geometry", "1920x1080", "-xstartup", "startplasma-x11"]