#
# Cookbook:: day2
# Recipe:: restart
#
# Copyright:: 2018, The Authors, All Rights Reserved.

service 'jboss5' do
  action :restart
end
