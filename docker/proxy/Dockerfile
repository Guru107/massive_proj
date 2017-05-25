FROM smebberson/alpine-nginx
#https://github.com/smebberson/docker-alpine/tree/master/alpine-nginx

#Copying conf file for nginx.conf
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

#Create an empty directory in run/nginx for pid as it is the default directory
RUN mkdir -p /run/nginx	

ENTRYPOINT nginx -g "daemon off;"
