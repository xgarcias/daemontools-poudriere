# daemontools-poudriere
Ansible role to deploy Poudriere and monitor the queues with daemontools

Modify the following variables to define the port and sets you want to configure.

```
poudriere_jail_list:
- { name: "103amd64", arch: "amd64", release: "10.3-RELEASE", default_set: "libressl", default_ports: "2017Q2" }

poudriere_ports_list:
- { name: "2017Q2", branch: "branches/2017Q2", method: "svn"}
```

The number of parallel jobs is configured with `poudriere_parallel_jobs: 2`

The jobs can be run in the tradicional way or also use the daemon service running with daemontools to queue tasks.  `roles/poudriere/files/make.sh` shows how to queue tasks for later execution.

```
#!/bin/sh
cat > /var/service/poudriere/queue/build <<EOF
ports -p 2017Q2 -u -v
bulk -j 103amd64 -p 2017Q2 -z libressl -f /usr/local/etc/poudriere.d/103amd64-2017Q2-libressl-pkglist
EOF
```
In the script above, `/var/service/poudriere/queue/` is the directory where we queue jobs and `build` is the name of our job.

The log output is available in the poudriere log subdirectory `/var/service/poudriere/log/main/current` and also in the poudriere  logs subdirectory `/pdr/data/logs/daemon/build.log`.
