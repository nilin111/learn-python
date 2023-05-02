# 设置 Python 运行时环境为 3.8
FROM python:3.8.5

# 设置工作目录
WORKDIR /app

# 复制当前目录中的 requirements.txt 文件到工作目录中
COPY requirements.txt .

# 安装所需的 Python 依赖项
RUN pip install --no-cache-dir -r requirements.txt

# 复制当前目录中的全部文件到工作目录中
COPY . .

# 设置环境变量
ENV DJANGO_SETTINGS_MODULE=myproject.settings
ENV PYTHONUNBUFFERED 1

# 公开服务器端口
EXPOSE 8000

# 使用 Gunicorn 作为 Web 服务器，并指定运行 Django 应用程序的 WSGI 文件
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
