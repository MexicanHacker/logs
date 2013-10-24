package("nginx")

remote_directory "/usr/share/nginx/html/kibana" do
  source "kibana"
  files_backup 10
  files_owner node[:default_owner_user]
  files_group node[:default_owner_group]
  files_mode "0755"
  owner "nobody"
  group "nobody"
  mode "0755"
  notifies :restart, "service[nginx]"
end
