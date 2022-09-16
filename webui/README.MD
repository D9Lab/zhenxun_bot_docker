## 添加webui  

**以下内容针对Portainer Stacks，Docker compose配置略有不同请自行修改**

在`Stacks`配置的`services`小节下新增以下内容
```
  webui:
    image: nginx
    container_name: zxbot_webui
    restart: unless-stopped
    volumes:
      - nginx_html_data:/usr/share/nginx/html
      - nginx_conf_data:/etc/nginx/conf.d
    ports:
      - 8090:8090
    links:
      - bot:bot
```
在`volumes`小节下新增以下内容
```
  nginx_data:
  nginx_confdata:
```

将`default.conf`复制到volume`nginx_conf_data`中

[下载webui](https://github.com/HibiKier/zhenxun_bot_webui)复制到volume`nginx_html_data`中

webui可于 http://IP:8090 访问到，api地址填写为http://IP:8090 
