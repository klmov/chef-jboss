default['day2']['jboss_path'] = '/opt'
default['day2']['jboss_home'] = "#{node['day2']['jboss_path']}/jboss"
default['day2']['jboss_user'] = 'jboss'
default['day2']['jboss_group'] = 'jboss'
default['day2']['jboss_version'] = '5.1.0.GA'
default['day2']['dl_url'] = "https://kent.dl.sourceforge.net/project/jboss/JBoss/JBoss-#{node['day2']['jboss_version']}/jboss-#{node['day2']['jboss_version']}.zip"



