#!/bin/sh
cat > /var/service/poudriere/queue/build <<EOF
ports -p 2017Q2 -u -v
bulk -j 103amd64 -p 2017Q2 -z libressl -f /usr/local/etc/poudriere.d/103amd64-2017Q2-libressl-pkglist
EOF

tail -F /var/service/poudriere/log/main/current|tai64nlocal
