FROM docker:dind
MAINTAINER  n.douma@nekoconeko.nl

COPY dind-opts.sh /usr/local/bin/

ENTRYPOINT ["dind-opts.sh"]
CMD []
