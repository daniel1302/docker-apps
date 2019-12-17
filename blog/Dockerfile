FROM golang:1.12.9
ARG BLOG_BASE_URL=http://localhost
ARG BLOG_PORT=1313

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
ENV HUGO_PORT=$BLOG_PORT

CMD [ "hugo", "server", "--appendPort=false", "--baseURL", "${HUGO_BASE_URL}", "--port", "${HUGO_PORT}", "--bind=0.0.0.0" ]
