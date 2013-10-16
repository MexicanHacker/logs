#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: java
# Attributes:: default 
#
# Copyright 2010, Opscode, Inc.
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

# default jdk attributes
default['java']['install_flavor'] = "openjdk"
default['java']['jdk_version'] = '6'
default['java']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i586"

case platform
when "centos","redhat","fedora","scientific","amazon"
  default['java']['java_home'] = "/usr/lib/jvm/java"
when "freebsd"
  default['java']['java_home'] = "/usr/local/openjdk#{java['jdk_version']}"
when "arch"
  default['java']['java_home'] = "/usr/lib/jvm/java-#{java['jdk_version']}-openjdk"
else
  default['java']['java_home'] = "/usr/lib/jvm/default-java"
end

# jdk6 attributes
# x86_64
default['java']['jdk']['6']['x86_64']['url'] = 'http://storage.tacitknowledge.com/tk-storage/common/public/software/downloads/oracle/jdk-6u31-linux-x64.bin'
default['java']['jdk']['6']['x86_64']['checksum'] = '0219d4feeedb186e5081ab092dfcda20c290fde5463f9a707e12fd63897fd342'

# i586
default['java']['jdk']['6']['i586']['url'] = 'http://storage.tacitknowledge.com/tk-storage/common/public/software/downloads/oracle/jdk-6u31-linux-i586.bin'
default['java']['jdk']['6']['i586']['checksum'] = '60fdd4083373db919334500b8050b326d45d78703aa2d403eda48cfa5621702b'

# jdk7 attributes
# x86_64
default['java']['jdk']['7']['x86_64']['url'] = 'http://storage.tacitknowledge.com/tk-storage/common/public/software/downloads/oracle/jdk-7u3-linux-x64.tar.gz'
default['java']['jdk']['7']['x86_64']['checksum'] = '28ff4bc3194617e0f6144013b1ca391b279804170e297faa6879963424846c2d'

# i586
default['java']['jdk']['7']['i586']['url'] = 'http://storage.tacitknowledge.com/tk-storage/common/public/software/downloads/oracle/jdk-7u3-linux-i586.tar.gz'
default['java']['jdk']['7']['i586']['checksum'] = '798a3ea1d390358bdc01911d9aab7da1ff887157b56becc0e07e6f2c031f9ded'
