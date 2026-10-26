FROM ubuntu:22.04

WORKDIR /var/www

RUN apt update && apt install -y --no-install-recommends python3 && rm -rf /var/lib/apt/lists/* 

COPY script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

CMD ["/bin/bash", "-c", "/usr/local/bin/script.sh & exec python3 -m http.server 8080"]
