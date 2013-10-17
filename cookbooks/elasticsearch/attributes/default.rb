# 
# Cookbook Name:: elasticsearch
# Attributes:: default
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

default[:elasticsearch] = {
  :version => "0.19.6-1.el6",
  :log_path => "/var/log/elasticsearch",
  :data_path => "/var/lib/elasticsearch",
  :work_path => "/tmp/elasticsearch",
  :conf_path => "/etc/elasticsearch",
  :conf_file => "elasticsearch.yml",
  :java_conf => "/usr/share/java/elasticsearch/bin/elasticsearch.in.sh",
  :min_mem => "512m",
  :max_mem => "512m",
  :cluster_name => "elasticsearch",
  :node_name => node[:hostname],
  :shards => "1",
  :replicas => "0",
}
