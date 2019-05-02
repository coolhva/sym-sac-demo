FROM nginx:1.15

MAINTAINER Henk van Achterberg <henk@vanachterberg.org>

EXPOSE 8001
EXPOSE 8002
EXPOSE 8003

# copy configurations of different sites
COPY conf /etc/nginx/conf.d/

# copy the files of the sites
COPY --chown=www-data:www-data app /app/

RUN chmod -R 755 /app

# Disable daemon mode
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    # Backup configs
    cp -a /etc/nginx/conf.d /etc/nginx/.conf.d.orig && \
    rm -f /etc/nginx/conf.d/default.conf

WORKDIR /etc/nginx

CMD ["nginx"]
