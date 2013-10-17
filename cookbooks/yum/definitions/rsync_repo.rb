#
# Author:: Josh Toft <jtoft@zinio.com>
# Author:: Bryce Lynn <bryce@tacitknowledge.com>
# Cookbook Name:: yum
# Definition:: rsync_repo
#
# Copyright 2011, Zinio, LLC
# Copyright 2012, Tacit Knowledge, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

define :rsync_repo, :rsync_url => nil, :local_path => nil do
  mirror = params[:name]
  directory "/etc/cron.d" do
    owner "root"
    group "root"
    mode "0755"
  end
  template "/etc/cron.d/yum_sync_#{mirror}" do
    source "rsync_repo.erb"
    mode 00644
    variables(
      :mirror =>  mirror, :rsync_url => params[:rsync_url], 
      :local_path => params[:local_path], :cron_times => params[:cron_times]
    )
  end
  directory params[:local_path] do
    owner 'root'
    group 'root'
    mode 0755
    action :create
    recursive true
  end
end
