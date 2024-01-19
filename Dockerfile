FROM selenium/standalone-chrome
RUN apt-get update && apt-get install -y \
   ca-certificates \
   wget \
   --no-install-recommends \
   && rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
   && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
   && apt-get update \
   && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont \
     --no-install-recommends \
   && rm -rf /var/lib/apt/lists/*
