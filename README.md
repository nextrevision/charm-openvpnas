# Overview

This charm provides OpenVPN Access Server (http://openvpn.net/index.php/access-server/overview.html). Below is a description taken from the main project site:

OpenVPN Access Server is a full featured SSL VPN software solution that integrates OpenVPN server capabilities, enterprise management capabilities, simplified OpenVPN Connect UI, and OpenVPN Client software packages that accommodate Windows, MAC, and Linux OS environments. OpenVPN Access Server supports a wide range of configurations, including secure and granular remote access to internal network and/ or private cloud network resources and applications with fine-grained access control. 

# Usage

To deploy the charm, you will first need a bootstrapped Juju environment and, at a minimum, capacity for one additional machine. You could deploy with jitsu using the 'deploy-to' option to deploy this charm to an existing machine.

Deploy openvpn-as to a bootstrapped environment:

    juju deploy openvpn-as

It is recommended that you change the default password for the instance:

    juju set openvpn-as password=newpassword

Finally, expose the service:

    juju expose openvpn-as

You can then browse to https://ip-address-or-fqdn/admin to configure OpenVPN-AS. The username and password by default are 'openvpn/openvpn-as'. If you set the password as recommended above, then use that password instead of the default.

# Configuration

There are a number of configuration options available via the charm. Most of the options, however, can be modified using the OpenVPN-AS Admin UI, but are provided in the charm as a means of convenience and rapid deployment.

By default, the username is 'openvpn' and PAM is used as the authentication backend. These options can be changed via the OpenVPN-AS Admin UI and are left at their default settings in order to ensure a low barrier to deployment. OpenVPN defaults to this username, and this username can be disabled if desired.

## FQDN

The FQDN of the service will default to the public address of the machine it is deployed on. The FQDN is referenced in the client configuration downloaded by clients connecting to the VPN. The VPN will not be able to establish a successful connection until the FQDN correctly resolves to the OpenVPN-AS service.

    juju set openvpn-as fqdn=example.site.com

## Password

This option sets the password on the service for the 'openvpn' admin user.

    juju set openvpn-as password=newpassword

## Port

The port configuration option determines the port used to manage, log in, and connect to the service. When the port is changed, any prior downloaded configurations will need to be reconfigured for each client previously using the service.

    juju set openvpn-as port=8443

## Client Network

The client network option configures the network used when assigning VPN clients addresses. If you're home or corporate network use the same range as the default, then you may consider changing it to an alternate network range. A CIDR value is required or a '/24' CIDR will be assigned to the network given.

    juju set openvpn-as client-network=10.11.12.0/23

## Reroute Gateway

By default all client traffic will be routed through the VPN tunnel. To disallow clients from sending all traffic through the VPN tunnel, set this value to 'False'. This will only allow clients to access remote subnets located behind the subnet. A list of networks to be routed through the VPN can be configured through the Admin UI.

    juju set openvpn-as reroute-gateway=False

## Reroute DNS

By default all DNS queries will be routed through the VPN tunnel. To disable this, set the following option to False.

    juju set openvpn-as reroute-dns=False

## License

In order to use more than the default 2 concurrent client sessions, a valid license will be needed from https://openvpn.net/index.php/access-server/license-key.html. Once a license has been acquired, you can install it via this option.

    juju set openvpn-as license=XXXXXXXXXXXXX

# Contact Information

Author: NextRevision <notarobot@nextrevision.net>
Report bugs at: http://bugs.launchpad.net/charms/+source/openvpn-as
Location: http://jujucharms.com/charms/distro/openvpn-as
