FROM alpine:latest
LABEL maintainer="43210663+tgauweiler@users.noreply.github.com"

RUN apk add --no-cache --update ca-certificates

COPY lgtm /bin

RUN chmod +x /bin/lgtm

VOLUME /var/lib/lgtm
EXPOSE 8989

CMD ["sh", "-c",\
    "/bin/lgtm -token $LGTM_TOKEN -gitlab_url $LGTM_GITLAB_URL -lgtm_count $LGTM_COUNT -lgtm_note $LGTM_NOTE -log_level $LGTM_LOG_LEVEL -db_path $LGTM_DB_PATH -port $LGTM_PORT -webhook_path $LGTM_WEBHOOK"\
    ]
