#
# Author:: Bryce Lynn <bryce@tacitknowledge.com>
# Cookbook Name:: yum
# Recipe:: rpmforge
#
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

include_recipe "yum::default"

# Manage the default key
cookbook_file "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag" do
  source "RPM-GPG-KEY-rpmforge-dag"
  owner "root"
  group "root"
  mode "0644"
end

yum_repository "rpmforge" do
  action :add
  options [ "exclude=nagios-nrpe" ]
end
