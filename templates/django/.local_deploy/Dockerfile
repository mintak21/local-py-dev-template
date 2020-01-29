# 必要なライブラリをインストールしただけのコンテナ
FROM python:3.8-alpine

RUN mkdir -p /usr/app
COPY requirements.txt /usr/app/requirements.txt
RUN pip install -r usr/app/requirements.txt && \
    rm -f /usr/local/application/requirements.txt

WORKDIR /usr/local/application

CMD ["/bin/sh"]
