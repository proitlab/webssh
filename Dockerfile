FROM python:3.10-alpine

RUN rm -fr /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN echo "Asia/Jakarta" > /etc/timezone

RUN mkdir /app
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#RUN apt update
# install dependencies
RUN pip install --no-cache-dir  --upgrade pip
COPY requirements.txt /app
RUN pip install --no-cache-dir  -r requirements.txt

# copy project
COPY . /app

EXPOSE 8008

ENTRYPOINT ["./entrypoint.ds"]
