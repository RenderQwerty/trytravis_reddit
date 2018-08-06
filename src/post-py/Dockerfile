FROM python:3.6.0-alpine
ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts
WORKDIR /build
COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app
ENTRYPOINT ["python3", "post_app.py"]
