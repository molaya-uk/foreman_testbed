nodes_config = YAML.load_file('nodes.yml')
puts nodes_config.inspect

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  nodes_config.each do |node|
    config.vm.define node['hostname'] do |host|
      host.vm.box = node['box']
      host.vm.hostname = node['hostname']
      host.vm.network "private_network", ip: node['ip']
      
      if node['ports']!=nil
        (node['ports']).each do |port|
          host.vm.network "forwarded_port", guest: port['guest'], host: port['host']
        end
      end

      if node['provisioners']!=nil
        node['provisioners'].each do |prov|
          if prov['type']=='file'
            host.vm.provision "file", source: prov['src'], destination: prov['dest']
          elsif prov['type']=='shell'
            host.vm.provision "shell", path: prov['src']
          elsif prov['type']=='ansible'
            host.vm.provision :ansible do |ansible|
              if prov['limit']!=nil
                ansible.limit = prov['limit']
              end
              ansible.playbook = prov['src']
            end
          end
        end
      end
    end
  end
end  
      
    

