FROM busybox:1.37-musl
COPY ubuntu-gate-memorial-day.html /www/index.html
EXPOSE 8080
CMD ["busybox", "httpd", "-f", "-p", "8080", "-h", "/www"]
