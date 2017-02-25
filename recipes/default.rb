#
# Cookbook:: chef_starter
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Add Swap to prevent out of memory errors
swap_file '/mnt/swap' do
  size node[:system][:swap_size]
  persist true
end

include_recipe 'sysctl::apply'

docker_service 'default' do
  action [:create, :start]
end

docker_image 'wernight/sikulix' do
  action :pull_if_missing
end
