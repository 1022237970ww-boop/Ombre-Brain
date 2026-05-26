# ============================================================
# Ombre Brain Docker Build
# Docker 构建文件
#
# Build: docker build -t ombre-brain .
# Run:   docker run -e OMBRE_API_KEY=your-key -p 8000:8000 ombre-brain
# ============================================================

FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY *.py .
COPY dashboard.html .
COPY config.yaml ./config.yaml
ENV OMBRE_TRANSPORT=streamable-http
ENV OMBRE_BUCKETS_DIR=/app/buckets
EXPOSE 8000
CMD ["python", "server.py"]
