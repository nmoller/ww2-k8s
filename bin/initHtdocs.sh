#!/bin/sh -

GET_VERSION=$1

getVersion() {
	VERSION=$1
	curl -fSL https://github.com/openwebwork/webwork2/archive/${VERSION}.tar.gz -o /tmp/${VERSION}.tar.gz
	mkdir -p /tmp/version
	tar -zxf /tmp/${VERSION}.tar.gz -C /tmp/version --strip-components=1

}

if [ -d /opt/webwork/webwork2/htdocs/ ] && [ ! -f /opt/webwork/webwork2/htdocs/index.html ]; then
	getVersion ${GET_VERSION}
	cp -r /tmp/version/htdocs /opt/webwork/webwork2
    # The UID of www-data of the container webwork
	chown -R 33:33 /opt/webwork/webwork2/htdocs
else
	echo 'Folder structure not ready'
fi