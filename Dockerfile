FROM alpine:latest

# 安装必要的软件
RUN apk add --no-cache curl unzip

# 下载并安装 Xray
RUN curl -L https://github.com/XTLS/Xray-core/releases/download/v1.8.4/Xray-linux-64.zip -o xray.zip && \
    unzip xray.zip && \
    chmod +x xray && \
    rm xray.zip

# 复制配置文件
COPY config.json /etc/xray/config.json

# 运行 Xray
CMD ["./xray", "run", "-config", "/etc/xray/config.json"]