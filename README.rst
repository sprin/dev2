=================
dev2 puppet files
=================

dev2 is a Centos 6.4-based dev environment for x86_64 arch. It was designed
to be run in VirtualBox on a MacOS host, but can be tweaked for other
deployments as well.

It features puppet management of:

 - Users
 - Startup scripts
 - RPM packages, including third-party YUM repos
 - iptables firewall
 - Multiple Python versions (2.6, 2.7, 3.3)
 - Virtual environments, including pip installs in venv
 - PostgreSQL databases

The only dependency is a Centos 6.4 system with the puppet client installed.
