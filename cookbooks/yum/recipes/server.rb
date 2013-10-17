#
# Author:: Josh Toft <jtoft@zinio.com>
# Author:: Bryce Lynn <bryce@tacitknowledge.com>
# Cookbook Name:: yum
# Recipe:: server
#
# Copyright 2011, Zinio, Inc.
# Copyright 2012, Tacit Knowledge, Inc.
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

include_recipe "yum"
include_recipe "nginx"
include_recipe "rsync"
include_recipe "cron"
require 'erb'

package "createrepo"

nginx_app "yum-repos" do
  docroot "#{node[:yum][:repo_dir]}"
  template "yum_mirror.conf.erb"
  server_name "yum.#{domain}"
  server_aliases [ "yum", "yum.#{domain}" ]
end

#See the comment in the default attributes file for the structure to use.
#Is there a slicker way to do this than nested iterators?
node[:yum][:serve_repos].each do |repo|
  repo[:versions].each do |version|
    repo[:basearchs].each do |basearch|
      full_local_path = node[:yum][:repo_dir] + "/" + 
        ERB.new(repo[:local_path]).result(binding)
      rsync_repo "#{repo[:name]}-RHEL-#{version}-#{basearch}" do
        rsync_url ERB.new(repo[:rsync_url]).result(binding)
        local_path full_local_path
        cron_times repo[:cron_times]
      end
    end
  end
end
