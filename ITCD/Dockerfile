FROM python:3.11

LABEL description Robot Framework in Docker.

# install google chrome
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb stable main"'
#RUN wget -q -O - https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install libxss1
RUN  apt-get install -y *.deb

# install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

RUN chmod 777 /usr/local/bin/chromedriver

# install font for other language
RUN apt-get update && \
    apt-get install -y \
        fonts-ipafont-gothic fonts-ipafont-mincho \
        ttf-wqy-microhei fonts-wqy-microhei       \
        fonts-tlwg-loma fonts-tlwg-loma-otf       \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip
COPY requirements.txt /tmp/requirements.txt
RUN  pip3 install -r /tmp/requirements.txt


COPY .   /tmp/