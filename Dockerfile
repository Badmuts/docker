FROM badmuts/development:ubuntu-php5-nginx
MAINTAINER Daan Rosbergen <d.rosbergen@gmail.com>

# Configure timezone
RUN echo "Europe/Amsterdam" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

# Set the locale
RUN locale-gen en_US.UTF-8
RUN locale-gen nl_NL.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LC_MONETARY nl_NL.UTF-8

# Start services
RUN service nginx restart
RUN service php5-fpm restart

# Load config files and start services
ADD startup.sh /usr/local/bin/startup.sh

# Make shell script executable
RUN chmod +x /usr/local/bin/startup.sh

# Run shell script
CMD ["/usr/local/bin/startup.sh"]
