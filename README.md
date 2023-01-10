# 使用 docker 部署 zhenxun_bot

![](https://img.shields.io/badge/Python%E7%89%88%E6%9C%AC-3.9-ff69b4?style=for-the-badge)
![](https://img.shields.io/badge/%E6%94%AF%E6%8C%81%E5%B9%B3%E5%8F%B0-amd64-8B008B?style=for-the-badge)

# 使用Portainer建立Stacks
打开Stacks，Add stack 粘贴以下代码  （如用Docker compose自行修改代码）
```
version: '3.4'

services:
  go-cqhttp:
    image: silicer/go-cqhttp:latest
    container_name: zxbot_go-cqhttp
    restart: unless-stopped
    volumes:
      - go-cqhttp_data:/data
      - bot_data:/bot
    links:
      - bot:bot  #配置为ws reverse，地址 ws://bot:8080/onebot/v11/ws

  postgres:
    image: postgres:14
    container_name: zxbot_postgres
    restart: unless-stopped
    environment:
      - POSTGRES_USER=zxbot
      - POSTGRES_PASSWORD=zxbot
      - POSTGRES_DB=zxbot_database
    volumes:
      - postgres_data:/var/lib/postgresql/data

  bot: #需要将 .env.dev 中的监听地址改为0.0.0.0
    image: disappear9/zhenxun_bot:latest
    container_name: zxbot_zhenxun_bot
    depends_on: 
      - postgres
    restart: unless-stopped
    environment:
      - SU=114514 #管理员QQ
      - DB=postgresql://zxbot:zxbot@postgres:5432/zxbot_database
    volumes:
      - bot_data:/bot
    links:
      - postgres:postgres

volumes: 
  bot_data:
  go-cqhttp_data:
  postgres_data:

```

### 如果你在 ARM 平台运行请查看
[![Github](https://shields.io/badge/GITHUB-SinKy--Yan-4476AF?logo=github&style=for-the-badge)](https://github.com/SinKy-Yan/zhenxunbot-docker)
[![DOCKER](https://shields.io/badge/docker-jyishit/zhenxun_bot-4476AF?logo=docker&style=for-the-badge)](https://hub.docker.com/r/jyishit/zhenxun_bot)

**如果你的机器 RAM < 1G  可能无法正常启动**

### 如果你需要webui请查看

[添加webui](/webui)

#### 指路
[![Github](https://shields.io/badge/GITHUB-HibiKier/zhenxun_bot-4476AF?logo=github&style=for-the-badge)](https://github.com/HibiKier/zhenxun_bot)
