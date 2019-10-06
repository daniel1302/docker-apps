#!/bin/bash
set -x;


#hugo new site blog;

echo $HUGO_BASE_URL;

if [ ! -e /app/blog/themes ]; then
    cd /app/blog                                                    \
        && hugo new site .                                          \
        && git init                                                 \
        && git clone https://github.com/goodroot/hugo-classic.git   \
            themes/classic                                          \
        && echo 'theme = "classic"' >> config.toml                  \
        && hugo new post/good-to-great.md;
fi;

cd /app/blog;
exec $(eval echo "$@")

#sleep 10000;
