# 使用基础镜像
FROM vevc/fml:latest

# 设置构建参数
ARG CONFIG_URL=https://raw.githubusercontent.com/whggo/one-node/refs/heads/main/hugging-face/app/xy/config.json

# 设置镜像元数据
LABEL maintainer="Your Name"
LABEL version="1.0"
LABEL description="Customized fml image with updated config"

# 安装curl（如果基础镜像中没有）
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# 下载并替换配置文件
RUN curl -o /app/xy/config.json ${CONFIG_URL}

# 验证配置文件是否已替换
RUN echo "配置文件已更新：" && ls -la /app/xy/config.json && \
    echo "文件大小：" && du -h /app/xy/config.json

# 设置工作目录（如果需要）
WORKDIR /app

# 设置默认命令（如果基础镜像没有指定）
CMD ["bash"]
