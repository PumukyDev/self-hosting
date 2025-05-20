FROM nginx:alpine

RUN apk add --no-cache netcat-openbsd

COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

ENTRYPOINT ["/wait-for-it.sh"]
CMD ["nginx", "-g", "daemon off;"]
