FROM alpine:3.8

RUN apk add --no-cache curl

COPY bin/initHtdocs.sh /usr/local/bin

ENTRYPOINT ["initHtdocs.sh"]
CMD ["rel-ww2.14"]