FROM vevc/fml:latest

ARG CONFIG_URL

# 安装curl并更新配置文件
RUN apt-get update && \
    apt-get install -y curl && \
    mkdir -p /app/xy && \
    curl -o /app/xy/config.json ${CONFIG_URL} && \
    apt-get remove -y curl && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# 验证配置文件
RUN echo "配置文件更新完成：" && \
    ls -la /app/xy/ && \
    echo "配置文件存在: $(test -f /app/xy/config.json && echo '是' || echo '否')"
