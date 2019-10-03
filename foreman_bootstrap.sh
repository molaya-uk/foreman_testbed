# Disable SE Linux
setenforce 0
sudo sed -i "s/^SELINUX=enforcing/SELINUX=permissive/"  /etc/sysconfig/selinux

# Install puppet repo
sudo yum -y install https://yum.puppet.com/puppet6-release-el-7.noarch.rpm

# Enable epel and foreman repos
sudo yum -y install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install https://yum.theforeman.org/releases/1.23/el7/x86_64/foreman-release.rpm

# Instal Foreman
yum -y install foreman-installer
foreman-installer

# Enable autosigning
sed -i 's/autosign.*/autosign=true/' /etc/puppetlabs/puppet/puppet.conf
service puppetserver restart
