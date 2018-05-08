#
# Cookbook:: day2
# Recipe:: deploy
#
# Copyright:: 2018, The Authors, All Rights Reserved.

remote_file "#{node['day2']['jboss_home']}/server/default/deploy/sample.war" do
  source 'https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war'
end
