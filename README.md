# assignmentBE



************
Requirements
************

Install Apache and PHP
CodeIgniter runs on Apache web server and written in PHP language, so you will need to install Apache and PHP to your system. First, install Apache web server with the following command:

sudo apt-get install apache2 -y
----------------------------------
By default, the latest version of the PHP is not available in Ubuntu 18.04, so you will need to add the repository for that. You can add PHP repository with the following command:

sudo apt-get install python-software-properties -y
----------------------------------------------------
sudo add-apt-repository -y ppa:ondrej/php
----------------------------------------------
Once the repository is updated, you can install PHP and other libraries with the following command:

sudo apt-get install libapache2-mod-php7.1 php7.1-common php7.1-xml php7.1-zip php7.1-mysql unzip wget -y
Next, start Apache web service and enable it to start on boot time:`


sudo systemctl start apache2
-------------------------------
sudo systemctl enable apache2
--------------------------------

Install CodeIgniter

You can download the latest version of the CodeIgniter from Git repository using the following command:

wget https://github.com/bcit-ci/CodeIgniter/archive/3.1.5.zip
-----------------------------------------------------------------------
Once the download is completed, unzip the downloaded file with the following command:

unzip 3.1.5.zip
Copy the extracted directory to the Apache root directory and give proper permissions with the following command:

sudo cp -r CodeIgniter-3.1.5 /var/www/html/rabobank-backend
sudo chown -R www-data:www-data /var/www/html/rabobank-backend
sudo chmod -R 777 /var/www/html/rabobank-backend/
Next, create an apache virtual host directive for rabobank-backend.


sudo nano /etc/apache2/sites-available/rabobank-backend.conf
Add the following lines:

<VirtualHost *:80>
 ServerAdmin allan@agiratech.com
 DocumentRoot /var/www/html/cts/rabobank-backend
 ServerName rabobank-backend.com
 <Directory /var/www/html/cts/rabobank-backend>
Options +FollowSymLinks
AllowOverride All
Order allow,deny
allow from all
 </Directory>
 ErrorLog /var/log/apache2/rabobank-backend-error_log
 CustomLog /var/log/apache2/rabobank-backend-access_log common
</VirtualHost>


Save and close the file, then enable virtual host file with the following command:

edit host file 
sudo nano /etc/hosts/
add 

127.0.1.1       rabobank-backend.com

sudo a2ensite rabobank-backend
Finally, restart apache service to apply all the changes:

systemctl restart apache2
Access rabobank-backend
Open your web browser and type the URL http://rabobank-backend.com,

****************
github
**************
checkout the master branch use command to checkout git fetch && git checkout


SQL
************

get updated sql from dbBackup folder and import into mysql and set the user name and password in application/config/database.php


