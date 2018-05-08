#
# Cookbook:: day2
# Recipe:: reload
#
# Copyright:: 2018, The Authors, All Rights Reserved.

service 'jboss5' do
  action :reload
end
