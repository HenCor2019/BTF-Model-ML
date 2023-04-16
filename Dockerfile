FROM tensorflow/serving:2.11.1-gpu AS build

ENV MODEL_BASE_PATH /models
ENV MODEL_NAME test_model
COPY ./test_model/ /models/test_model

COPY tf_serving_entrypoint.sh /usr/bin/tf_serving_entrypoint.sh
RUN chmod +x /usr/bin/tf_serving_entrypoint.sh
ENTRYPOINT []
CMD ["/usr/bin/tf_serving_entrypoint.sh"]
