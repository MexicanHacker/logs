#
# Author:: Josh Toft <jtoft@zinio.com>
# Cookbook Name:: yum
# Recipe:: epel_server
#
# Copyright 2011, Zinio, Inc.
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

directory "/opt/yum_mirrors/epel/5/x86_64" do
  owner "nginx"
  group "root"
  mode "0755"
  action :create
  recursive true
end

rsync_repo "epel" do
  rsync_url "rsync://mirrors.servercentral.net/fedora/epel/5/x86_64"
end

yum_repository "epel" do
  description "Extra Packages for Enterprise Linux 5 - $basearch"
  url "http://localhost/epel/$releasever/$basearch/"
  enabled true
  action :add
end
