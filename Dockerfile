FROM pockost/nginx-modsecurity

COPY default.conf /etc/nginx/conf.d/default.conf
COPY proxy-entrypoint.sh /usr/local/bin/proxy-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/proxy-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
