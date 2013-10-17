#
# Author:: Josh Toft <jtoft@zinio.com>
# Author:: Bryce Lynn <bryce@tacitknowledge.com>
# Cookbook Name:: yum
# Attributes:: default 
#
# Copyright 2011, Zinio, LLC.
# Copyright 2011, Eric G. Wolfe 
# Copyright 2011, Opscode, Inc.
# Copyright 2012, Tacit Knowledge, LLC.
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

# Example: override.yum.exclude = [ "kernel*", "compat-glibc*" ]
#          override.yum.installonlypkgs = [ "kernel*", "compat-glibc*" ]
default[:yum][:exclude] = Array.new
default[:yum][:installonlypkgs] = Array.new

default[:yum][:repo_dir] = "/opt/yum_mirrors"
default[:yum][:key_path] = "/etc/pki/rpm-gpg"

#This example shows how you would set the serve_repos attribute
#  Notice that the rsync_url is in ERB format, with version and basearch
#  variables available. local_path is relative to node[:yum][:repodir].
#  You would generally set this attribute in an environment or site-cookbook
#default[:yum][:serve_repos] = [
#  { :name => "epel",
#    :versions => [ "5", "6" ],
#    :basearchs => [ "x86_64" ],
#    :rsync_url => "rsync://mirrors.servercentral.net/fedora/epel/<%=version%>/<%=basearch%>"
#    :local_path => "epel/<%=version%>/<%=basearch%>"
#    :cron_times => "0 23 * * *"
#  }
#]
default[:yum][:serve_repos] = []

# boolean attribute to update system
default[:yum][:upgrade] = false

# local yum server - all or nothing, right now.  probably don't need per-repo
default[:yum][:local_server] = nil

# default repo information
version = node[:platform_version].to_i
default[:yum][:default_repos] = ["base", "updates", "extras"]
default[:yum][:repos] = {
  :base => {
    :description => "CentOS-#{version} - Base",
    :mirrorlist => "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os",
    #:url => "http://mirror.centos.org/centos/$releasever/os/$basearch/",
    :key => "/RPM-GPG-KEY-CentOS-#{version}"
  },
  :updates => {
    :description => "CentOS-#{version} - Updates",
    :mirrorlist => "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates",
    #:url => "http://mirror.centos.org/centos/$releasever/updates/$basearch/",
    :key => "/RPM-GPG-KEY-CentOS-#{version}"
  },
  :extras => {
    :description => "CentOS-#{version} - Extras",
    :mirrorlist => "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras",
    #:url => "http://mirror.centos.org/centos/$releasever/extras/$basearch/",
    :key => "/RPM-GPG-KEY-CentOS-#{version}"
  },
  :centosplus => {
    :description => "CentOS-#{version} - Plus",
    :mirrorlist => "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus",
    #:url => "http://mirror.centos.org/centos/$releasever/centosplus/$basearch/",
    :key => "/RPM-GPG-KEY-CentOS-#{version}"
  },
  :contrib => {
    :description => "CentOS-#{version} - Contrib",
    :mirrorlist => "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib",
    #:url => "http://mirror.centos.org/centos/$releasever/contrib/$basearch/",
    :key => "/RPM-GPG-KEY-CentOS-#{version}"
  },
  :debug => {
    :description => "CentOS-#{version} - Debuginfo",
    :url => "http://debuginfo.centos.org/$releasever/$basearch"
  },
  :epel => {
    :description => "Extra Packages for Enterprise Linux #{version}",
    :url => "http://mirrors.servercentral.net/fedora/epel/$releasever/$basearch/",
    :key => "RPM-GPG-KEY-EPEL-#{version}"
  },
  :remi => {
    :description => "Les RPM de remi pour Enterprise Linux $releasever - $basearch",
    :mirrorlist => "http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror",
    :key => "RPM-GPG-KEY-remi"
  },
  :rbel => {
    :description => "RBEL #{version} Repo",
    :url => "http://rbel.frameos.org/stable/el#{version}/$basearch",
    :key => "RPM-GPG-KEY-RBEL"
  },
  :rpmforge => {
    :description => "RHEL $releasever - RPMforge.net - dag",
    :mirrorlist => "http://apt.sw.be/redhat/el#{version}/en/mirrors-rpmforge",
    #:url => "http://apt.sw.be/redhat/el#{version}/en/$basearch/rpmforge",
    :key => "RPM-GPG-KEY-rpmforge-dag"
  },
  "rpmforge-extras" => {
    :description => "RHEL $releasever - RPMforge.net - extras",
    :mirrorlist => "http://apt.sw.be/redhat/el#{version}/en/mirrors-rpmforge-extras",
    #:url => "http://apt.sw.be/redhat/el#{version}/en/$basearch/extras",
    :key => "RPM-GPG-KEY-rpmforge-dag"
  },
  "rpmforge-testing" => {
    :description => "RHEL $releasever - RPMforge.net - testing",
    :mirrorlist => "http://apt.sw.be/redhat/el#{version}/en/mirrors-rpmforge-testing",
    #:url => "http://apt.sw.be/redhat/el#{version}/en/$basearch/testing",
    :key => "RPM-GPG-KEY-rpmforge-dag"
  },
  "jpackage-generic" => {
    :description => "JPackage (free), generic",
    :mirrorlist => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0",
    :key => "RPM-GPG-KEY-JPACKAGE",
    #their jpackage-utils breaks tomcat6 dependency
    :options => [ "exclude=jpackage-utils" ]
  },
  "jpackage6-generic" => {
    :description => "JPackage (free), generic",
    :mirrorlist => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0",
    :key => "RPM-GPG-KEY-JPACKAGE",
    #their jpackage-utils breaks tomcat6 dependency
    :options => [ "exclude=jpackage-utils" ]
  },
  "jpackage-generic-updates" => {
    :description => "JPackage (free), generic",
    :mirrorlist => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0-updates",
    :key => "RPM-GPG-KEY-JPACKAGE"
  },
  "jpackage-rhel" => {
    :description => "JPackage (free), for Red Hat Enterprise Linux $releasever",
    :mirrorlist => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-$releasever&type=free&release=5.0",
    :key => "RPM-GPG-KEY-JPACKAGE"
  },
  "jpackage-rhel-updates" => {
    :description => "JPackage (free), for Red Hat Enterprise Linux $releasever",
    :mirrorlist => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-$releasever&type=free&release=5.0-updates",
    :key => "RPM-GPG-KEY-JPACKAGE"
  },
  "jenkins" => {
    :description => "Jenkins CI",
    :url => "http://pkg.jenkins-ci.org/redhat",
    :key_url => "http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key",
    :key => "RPM-GPG-KEY-JENKINS"
  },
  "atrpms" => {
    :description => "Enterprise Linux $releasever - $basearch - ATrpms",
    :url => "http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable",
    :key => "RPM-GPG-KEY-ATRPMS"
  },
  "atrpms-testing" => {
    :description => "Enterprise Linux $releasever - $basearch - ATrpms-testing",
    :url => "http://dl.atrpms.net/el$releasever-$basearch/atrpms/testing",
    :key => "RPM-GPG-KEY-ATRPMS"
  },
  :chrome => {
      :description => "google-yum - 64-bit",
      :mirrorlist => false,
      :url => "http://dl.google.com/linux/chrome/rpm/stable/x86_64/"
  },
  "datastax" => {
    :description => "DataStax Repo for Apache Cassandra",
    :url => "http://rpm.datastax.com/community"
  },
    "tacit" => {
    :description => "Tacit repo",
    :url => "http://yum.tacitknowledge.com/tacit/el6/tacit/x86_64/"
  }
}
default[:yum][:timeout] = 30
