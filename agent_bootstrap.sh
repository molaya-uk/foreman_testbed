# Disable SE Linux
setenforce 0
sudo sed -i "s/^SELINUX=enforcing/SELINUX=permissive/"  /etc/sysconfig/selinux


# Install Puppet Agent
#rpm -Uvh https://yum.puppet.com/puppet5-release-el-7.noarch.rpm
sudo yum -y install https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum -y install puppet

# Configure Agent
echo '[main]' >> /etc/puppetlabs/puppet/uppet.conf
echo 'server=foreman.local.com' >> /etc/puppetlabs/puppet/puppet.conf
echo 'runinterval=5m' >> /etc/puppetlabs/puppet/puppet.conf
