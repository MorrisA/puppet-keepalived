This is a basic keepalived module intended for use with the puppetlabs 
openstack swift modules.

This sets up a basic keepalived configuration with a single VRRP instance
on a single interface and a set of virtual ips.

It defines one class:
keepalived
which takes four parameters:
instance = The vrrp instance id, this defaults to 23.
priority = The priority to set for this node.  I have used the fourth octet of 
	the ip address of this node in the example site.pp.  If your servers
	are on different subnets then you might want to use some other
	mechanism to determine priority.
interface = the interface device that the daemon should use
vips = A hash of all of the IP addresses that keepalived should be advertising



