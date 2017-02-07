# puppet-openresty

## Setup

1. Install Puppet
2. Copy the entire folder in /etc/puppet/modules
3. include the class (puppet-openresty in site.pp present in /etc/puppet/manifests)

## Test

1. Copy manifests/install.pp to /etc/puppet/manifests/
2. Comment class declaration.
3. cd /etc/puppet/manifests/
4. sudo puppet apply --verbose  install.pp 

