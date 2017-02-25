Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    # meminfo returns kilobytes, convert to MB
    v.memory = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    v.cpus = `nproc`.to_i
  end
end
