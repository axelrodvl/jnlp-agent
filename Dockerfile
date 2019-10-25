FROM jenkins/jnlp-agent-alpine

RUN echo http://mirror.yandex.ru/mirrors/alpine/v3.9/main > /etc/apk/repositories; \
    echo http://mirror.yandex.ru/mirrors/alpine/v3.9/community >> /etc/apk/repositories; \
    echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories 

RUN apk --no-cache add curl bash grep ca-certificates openjdk11 git

ADD https://storage.googleapis.com/kubernetes-release/release/v1.16.2/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl
RUN kubectl version --client

USER jenkins

ENTRYPOINT ["jenkins-slave"]
