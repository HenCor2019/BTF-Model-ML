FROM tensorflow/serving:2.11.1-gpu AS build

ENV MODEL_BASE_PATH /models
ENV MODEL_NAME test_model
COPY ./test_model/ /models/test_model

RUN echo '#!/bin/bash \n\n\
tensorflow_model_server  --rest_api_port=$PORT \
--model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} \
"$@"' > /usr/bin/tf_serving_entrypoint.sh \
&& chmod +x /usr/bin/tf_serving_entrypoint.sh

CMD ["/usr/bin/tf_serving_entrypoint.sh"]
