FROM ubuntu

RUN apt-get install -y wget

RUN wget -O - http://repo.openrepose.org/debian/pubkey.gpg | apt-key add - && echo "deb http://repo.openrepose.org/debian stable main" > /etc/apt/sources.list.d/openrepose.list

RUN apt-get update && apt-get install -y \
  repose-valve \
  repose-filter-bundle \
  repose-extensions-filter-bundle

CMD ["java", "-jar", "/usr/share/repose/repose-valve.jar"]
