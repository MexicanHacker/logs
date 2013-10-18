name "base"
description "The role for all VMs"

env_run_lists "_default" => %w[
    yum
    elasticsearch
    nginx
]

default_attributes \
  :yum => { :default_repos => ["base","updates","extras","rbel","epel", "rpmforge", "tacit"], :upgrade => false },
  :timezone => 'US/Eastern',
  :iptables => { :enabled => false}
