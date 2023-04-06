FROM tensorflow/serving:2.11.1-gpu AS build

RUN mkdir -p /usr/src/models
COPY ./brain_tumor_detection/ /usr/src/models/brain_tumor_detection

WORKDIR /usr/src/models

EXPOSE 8501

