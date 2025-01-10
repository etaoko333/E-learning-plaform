# our script tht can helps us to deploy appache and our E-commerce store.
#!/bin/bash 
sudo su                                                          #root user
yum update -y                                                    #update the package manager
yum install -y httpd                                             #install appache server
mkdir store-dir                                                  #create directory
cd store-dir                                                     #change into the created file 
wget https://www.free-css.com/assets/files/free-css-templates/download/page291/elearning.zip #download template
unzip elearning.zip                                                 #unzip the file
cd elearning-html-template                                        #change directory into the unzip file                                             
mv * /var/www/html/   #move the file to appache directory                                            #
cd /var/www/html/      #switch to appache path
systemctl enable httpd  #to enable appache webserver
systemctl start httpd   #to start appache webserver