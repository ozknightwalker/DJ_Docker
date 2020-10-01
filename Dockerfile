FROM python:3.6.12-alpine

ENV PYTHONUNBUFFERED 1

WORKDIR /code

COPY requirements.txt .

RUN apk upgrade \
	&& apk add --no-cache --virtual .build-deps \
		postgresql-dev \
		gcc \
		python3-dev \
		musl-dev \
	&& pip3 install -r requirements.txt --no-cache-dir \
	&& apk del .build-deps


RUN apk upgrade && pip install -r requirements.txt --no-cache-dir

COPY . .

EXPOSE 8000
