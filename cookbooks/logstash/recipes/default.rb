package("java")

remote_directory "/opt/logstash" do
  source "logstash"
  files_backup 10
  files_owner node[:default_owner_user]
  files_group node[:default_owner_group]
  files_mode "0755"
  owner "nobody"
  group "nobody"
  mode "0755"
end

service "logstash" do
  supports :restart => true, :start => true, :stop => true, :reload => true
  action :nothing
end 

template "logstash" do
  path "/etc/init.d/logstash"
  source "init.erb"
  owner "root"
  group "root"
  mode "0755"
  notifies :enable, "service[logstash]"
  notifies :start, "service[logstash]"
end

template "/opt/logstash/logstash.conf" do
  owner "root"
  group "root"
  mode "0644"
  source "logstash.conf.erb"
  notifies :restart, resources(:service => "logstash")
end

service "elasticsearch" do
  action [ :enable, :start ]
end
