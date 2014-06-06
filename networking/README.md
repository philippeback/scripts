Networking scripts
==================

First of all, NetworkManager is making your life hell if you are used to "the normal way of Unix to not surprise you when you do not expect to be".

So,

chkconfig NetworkManager off
service NetworkManager stop
chkconfig network on
service network start

Files you like to get right:

/etc/sysconfig/network-scripts/ifcfg-eth0

Also, get rid of:

/etc/udev/rules.d/70-persistent-net-rules.<something>

and

start_udev

Now, things should be all right.

Put the Google DNS servers n /etc/sysconfig/network
These work nicely.

All the files in this folder should help you get things right.

service network restart


