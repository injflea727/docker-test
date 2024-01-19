FROM selenium/standalone-chrome

USER root

RUN apt-get update && apt-get install -y \
   ca-certificates \
   wget \
   --no-install-recommends \
   && rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-archive-keyring.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/google-archive-keyring.gpg arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
 && apt-get update \
 && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf \
   --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*
FROM my-chromium
USER root
RUN apt-get update && apt-get install -y xvfb
CMD ["sh", "-c", "Xvfb :1 -screen 0 1024x768x16 &>/dev/null & export DISPLAY=:1 && google-chrome-unstable"]