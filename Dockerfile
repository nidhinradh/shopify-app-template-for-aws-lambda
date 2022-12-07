FROM public.ecr.aws/lambda/nodejs:18

ARG SHOPIFY_API_KEY
ENV SHOPIFY_API_KEY=$SHOPIFY_API_KEY

COPY web  ${LAMBDA_TASK_ROOT}/

RUN npm install

RUN cd frontend && npm install && npm run build

CMD [ "app.handler" ]