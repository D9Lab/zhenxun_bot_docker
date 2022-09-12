FROM python:3.9-slim

ENV TZ=Asia/Shanghai
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
ENV TZ Asia/Shanghai
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /app

COPY ["requirements.txt","zx-cli","bot.tar.gz","/app/"]

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >/etc/timezone \
	&& apt-get update --fix-missing -o Acquire::http::No-Cache=True \
	&& apt-get install -y --assume-yes apt-utils --no-install-recommends \
	vim \
	wget \
	git \
	build-essential \
	libgl1 \
	libglib2.0-0 \
	libnss3 \
	libnss3-dev \
	libatk1.0-0 \
	libatk-bridge2.0-0 \
	libcups2 \
	libxkbcommon0 \
	libxcomposite1 \
	libxrandr2 \
	libgbm1 \
	libgtk-3-0 \
	libasound2 \
	zlib1g-dev \
	libncurses5-dev \
	libgdbm-dev \
	libssl-dev \
	libreadline-dev \
	libffi-dev \
	ffmpeg \
	libzbar0 \
	locales \
	locales-all \
	libgbm-dev \
	libxshmfence1 \
	ttf-wqy-zenhei \
	xfonts-intl-chinese \
	wqy* \
	fonts-noto \
	fonts-wqy-microhei \
	&& pip install -r requirements.txt --no-cache-dir \
	&& pip install rich requests jinja2 thefuzz aiocache baike imageio markdown


CMD ["./zx-cli","-mode","docker"]




