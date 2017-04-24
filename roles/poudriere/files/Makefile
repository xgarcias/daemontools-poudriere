JAILNAME ?=	"103amd64"
PORTNAME ?=	"2017Q2"
SETNAME  ?=	"libressl"


all: launch

launch:
	cat > /var/service/poudriere/queue/build <<EOF
	ports -p ${PORTNAME} -u -v
	bulk -j ${JAILNAME} -p ${PORTNAME} -z ${SETNAME} -f /usr/local/etc/poudriere.d/${JAILNAME}-${PORTNAME}-${SETNAME}-pkglist
	EOF
