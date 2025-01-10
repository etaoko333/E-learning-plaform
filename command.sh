#!/bin/bash
# Script to deploy Apache and set up an e-commerce store

# Update the package manager
yum update -y

# Install Apache server and unzip utility
yum install -y httpd unzip

# Create a directory for the store if it doesn't exist
mkdir -p /home/ec2-user/store-dir
cd /home/ec2-user/store-dir

# Download the template
wget https://www.free-css.com/assets/files/free-css-templates/download/page291/elearning.zip

# Unzip the file
unzip elearning.zip

# Move the files to the Apache directory
mv elearning-html-template/* /var/www/html/

# Enable and start the Apache webserver
systemctl enable httpd
systemctl start httpd
