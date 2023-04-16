FROM tensorflow/serving:2.11.1-gpu AS build

RUN mkdir -p /usr/src/models
COPY ./test_model/ /usr/src/models/test_model

WORKDIR /usr/src/models

EXPOSE 8501

