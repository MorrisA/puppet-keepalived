#
# This is intended to be an adjunct to the Puppetlabs swift modules
#

#
# Configuration variables
#
#$swift_local_net_ip   = $ipaddress_eth0
$swift_local_net_ip = hiera('swift_local_net_ip', $ipaddress_eth1)

#$swift_keystone_node = '172.16.0.21'
$swift_keystone_node    = hiera('swift_keystone_node', '192.168.23.50')
#$swift_proxy_node    = '172.168.0.25'
$swift_proxy_node       = hiera('swift_proxy_node', '192.168.23.51')


#
# The node definition
#
node /ha-proxy/ {

  #
  # Start with keepalived, use the fourth octest as the priority
  #
  class { 'keepalived':
    priority => regsubst($swift_local_net_ip,'^(\d+)\.(\d+)\.(\d+)\.(\d+)$','\4'),
    instance => '23',
    interface => 'eth1',
    vips => [ $swift_keystone_node, $swift_proxy_node ],
  }
  
}

