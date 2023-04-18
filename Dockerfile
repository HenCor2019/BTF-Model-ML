FROM tensorflow/serving:2.11.1-gpu AS build
FROM hencor2019/brain_tumor_detection:v0.0.2

ENV MODEL_BASE_PATH /models
ENV MODEL_NAME brain_tumor_detection

COPY --from=build /usr/local/bin/tensorflow_model_server /usr/bin/tensorflow_model_server

RUN echo '#!/bin/bash \n\n\
tensorflow_model_server  --rest_api_port=$PORT \
--model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} \
"$@"' > /usr/bin/tf_serving_entrypoint.sh \
&& chmod +x /usr/bin/tf_serving_entrypoint.sh

ENTRYPOINT []
CMD ["/usr/bin/tf_serving_entrypoint.sh"]
