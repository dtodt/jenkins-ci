# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

# host machine configuration
HOST_VAGRANT      = "."
HOST_WORKSPACE    = "/Users/Shared/vagrant/"

# dev machine configuration
GUEST_VAGRANT     = "/vagrant"
GUEST_BASE_IP     = "192.168.50."
GUEST_MAC         = "255.255.255.0"

# jenkins configuration
JENKINS_MEMSIZE   = 1024
JENKINS_CPU       = 4
JENKINS_HOST      = "jenkins"
JENKINS_IP        = "150"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "allanchau/xenial64"

  # configure vagrant-timezone plugin
  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = :host
  end

  config.vm.define JENKINS_HOST do |jenkins|
    jenkins.vm.synced_folder HOST_WORKSPACE + JENKINS_HOST + "/", "/workspace"

    jenkins.vm.provider :virtualbox do |vb, override|
      override.vm.network :private_network, ip: GUEST_BASE_IP + JENKINS_IP, :netmask => GUEST_MAC
      override.vm.hostname  = JENKINS_HOST
      vb.name               = JENKINS_HOST
      vb.memory             = JENKINS_MEMSIZE
      vb.cpus               = JENKINS_CPU
    end

  end

end