FROM docker.io/leo6/baseimage
##MAINTAINER liuliangliang 2017-12-06
ADD file/opt.tgz /opt/

RUN cd /opt/ \
&&  yum install libaio libaio-devel -y \
&& mv supervisord.conf /etc/  \
&& cp docker-entrypoint.sh /usr/bin/  \
&& chmod 777 /usr/bin/docker-entrypoint.sh \
&& yum clean all

ENTRYPOINT ["docker-entrypoint.sh"]

ENV PATH $PATH:/usr/local/mysql/bin:/usr/local/mysql/scripts:/usr/bin


CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
