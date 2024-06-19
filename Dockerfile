# Use the official httpd image as the base
FROM httpd:2.4

# Copy your static HTML files to the default Apache web root
COPY . /usr/local/apache2/htdocs/

# Enable SSL module
RUN sed -i '/LoadModule rewrite_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule ssl_module/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Copy SSL certificate and key
COPY ssl.crt /etc/apache2/ssl/ssl.crt
COPY ssl.key /etc/apache2/ssl/ssl.key

# Expose port 80 and 443 for SSL
EXPOSE 80
EXPOSE 443

# Start Apache server
CMD ["httpd-foreground"]