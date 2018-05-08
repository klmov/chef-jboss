#
# Cookbook:: day2
# Recipe:: deploy 
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'java_se'
package 'unzip'

user node['day2']['jboss_user'] do
  comment 'jboss User'
  home node['day2']['jboss_home']
  system true
  shell '/bin/false'
end

group node['day2']['jboss_group'] do
  action :create
end

remote_file './jboss.zip' do
  source node['day2']['dl_url']
  show_progress true
end

bash 'unarchive' do
  code <<-EOH
    mkdir -p #{node['day2']['jboss_home']}
    unzip /jboss.zip -d #{node['day2']['jboss_path']}
    cp -r #{node['day2']['jboss_path']}/jboss-5.1.0.GA/* #{node['day2']['jboss_home']}
    chown -R #{node['day2']['jboss_user']}:#{node['day2']['jboss_group']} #{node['day2']['jboss_home']}
    EOH
end

template '/usr/lib/systemd/system/jboss5.service' do
  source 'jboss.service.erb'
  mode 0775
  owner 'root'
  group node['root_group']
  notifies :enable, 'service[jboss5]', :delayed
  notifies :restart, 'service[jboss5]', :delayed
end

service 'jboss5' do
  supports restart: true
  supports reload: true
  supports start: true
  supports stop: true
  action :enable
end
