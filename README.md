# XML AMI

Basic setup for a XML AMI using Centos 6.10.

Things this does:

Runs CIS hardening from a community Centos module disabling required areas to support cloud images and some areas we configure later (firewall, logs)

Sets up EPEL (required for some dependancy services)

Configures a basic ClamAV setup - this is a basic setup with minimal configuration to run the service.

Configures the Cloudwatch Agent for remote logging and provides the metrics that will be required for our availability setup

Common elements between EWF and XML:

setenforce 0 - disable selinux for session and make persistent below:
/etc/selinux/config: set SELINUX=permissive
Installed packages from RedHat: 
httpd
openssl
mod_ssl
mod_perl
Installed packages from Oracle: 
oracle-instantclient11.2-basic
oracle-instantclient11.2-devel
oracle-instantclient11.2-sqlplus
 chkconfig  httpd on
groupadd -g600 chlservices
/etc/ld.so.conf: Add following lines then run ldconfig
/usr/lib/oracle/11.2/client64/lib/
/usr/local/lib
TNS Names:
/usr/lib/oracle/11.2/client64/lib/tnsnames.ora
ENV Vars for users of sqlplus:
export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib/
export TNS_ADMIN=/usr/lib/oracle/11.2/client64/lib/

XML Application Specific:
useradd xmllive -g 600
Xerces is located here:
/usr/local/lib - created following symbolic links:
ln -s libxerces-c.so.27.0 libxerces-c.so.27
ln -s libxerces-c.so.27.0 libxerces-c.so
ln -s libxerces-depdom.so.27.0 libxerces-depdom.so
ln -s libxerces-depdom.so.27.0 libxerces-depdom.so.27
/etc/httpd/conf/httpd.conf
/etc/httpd/conf/startup.pl
/etc/httpd/conf.d/perl.conf
/home/xmllive/ - This is the main application directory
/home/ewflive/config/My/XMLGWConfig.pm - XML Application config
Resources needed from existing onsite servers:
/home/xmllive
/usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5
/etc/httpd/conf/httpd.conf
Changed Listen Directive to Listen 0.0.0.0:80
/etc/httpd/conf/startup.pl
/etc/httpd/conf.d/perl.conf
/usr/local/lib/


