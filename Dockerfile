FROM python:3.12-slim
# ติดตั้ง uv ใน image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv
WORKDIR /app
# Copy ไฟล์ config ของ uv
COPY pyproject.toml uv.lock ./
# Install dependencies
RUN uv sync --frozen
# Copy โค้ด
COPY . .
# รัน server
CMD ["uv", "run", "manage.py", "runserver", "0.0.0.0:8000"]