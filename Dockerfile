# Use the official httpd image as the base
FROM httpd:2.4

# Enable necessary Apache modules
RUN a2enmod ssl

# Copy SSL certificate and private key
# COPY ./certificate.crt /etc/apache2/ssl/ssl.crt
# COPY ./private.key /etc/apache2/ssl/ssl.key

# Copy your static HTML files to the default Apache web root
COPY ./ /usr/local/apache2/htdocs/

# Expose port 80 and 443 for SSL
EXPOSE 80
EXPOSE 443

# Start Apache server
CMD ["httpd-foreground"]