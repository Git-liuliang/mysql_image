FROM docker.io/leo6/baseimage
##MAINTAINER liuliangliang 2017-12-26

ADD file/* /opt/


RUN cd /opt/ \
&& cp superme /usr/bin/ \
&& chmod +x /usr/bin/superme \
&& cp superme.conf /etc/ \
&& chmod +x /etc/superme.conf \
&&  yum install libaio libaio-devel wget  -y \
&&  wget http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-5.5.54-linux2.6-x86_64.tar.gz \
&& chmod +x /opt/automysql \
&& /opt/automysql \
&& yum clean all



ENV PATH $PATH:/usr/local/mysql/bin:/usr/local/mysql/scripts:/usr/bin


CMD ["/usr/bin/superme"]
