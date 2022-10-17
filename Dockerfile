FROM python:3.9-slim

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY ["requirements.txt","zx-cli","bot.tar.gz","/app/"]

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >/etc/timezone \
	&& apt-get update --fix-missing -o Acquire::http::No-Cache=True \
	&& apt-get install -y --assume-yes apt-utils --no-install-recommends \
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
	ffmpeg \
	wget \
	net-tools \
	fonts-wqy-microhei \
	&& apt clean \
	&& pip install -r requirements.txt --no-cache-dir \
	&& pip install rich requests jinja2 thefuzz aiocache baike imageio pinyin \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' > /etc/timezone

CMD ["./zx-cli","-mode","docker"]
