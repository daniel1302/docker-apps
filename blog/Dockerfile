FROM golang:1.12.9
ARG BLOG_BASE_URL=http://localhost:1311
WORKDIR /app/blog

RUN mkdir /app/src   \
    && cd /app/src      \
    && git clone https://github.com/gohugoio/hugo.git \
    && cd /app/src/hugo     \
    && go install --tags extended

COPY ./blog/entrypoint.sh /entrypoint.sh


EXPOSE 1313

ENTRYPOINT [ "/entrypoint.sh" ]

ENV HUGO_BASE_URL=$BLOG_BASE_URL

CMD [ "hugo", "server", "-b", "${HUGO_BASE_URL}", "--bind=0.0.0.0" ]
