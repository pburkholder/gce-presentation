#
# Cookbook Name:: my-app
# Recipe:: application
#
# Copyright 2013 - 2014, Chef Software, Inc.
#
# All rights reserved - Do Not Redistribute
#

# This recipe will deploy a simple little python web app

include_recipe 'libarchive::default'
include_recipe 'python'
include_recipe 'mysql::client'

python_pip 'django' do
  version '1.5.2'
end

python_pip 'MySQL-python' do
  version '1.2.5'
end

# make a dir for the site's config ini file
directory '/opt/conf/mysite' do
  mode '0755'
  recursive true
end

# Get the database host if it's not specified
if node['my-app']['database']['db_host']
  db_host = node['my-app']['database']['db_host']
  Chef::Log.info("database host was specified: #{db_host}")
else
  query = 'tags:myapp-database AND chef_environment:' + node.chef_environment
  Chef::Log.info('determining database host via search on: ' + query)
  db = partial_search(
    :node, query, :keys => { 'ipaddress' => ['ipaddress'] }
  ).first
  db_host = db['ipaddress']
end

mysite_archive = File.join(Chef::Config[:file_cache_path], node['my-app']['application']['package'])

# Clean up for rollbacks
Dir::glob("#{Chef::Config[:file_cache_path]}/mysite*.tar.gz").each do |f|
  file f do
    action :delete
    not_if {f == mysite_archive}
    notifies :extract, "libarchive_file[#{node['my-app']['application']['package']}]"
  end
end

# Fetch the application
remote_file "#{Chef::Config[:file_cache_path]}/#{node['my-app']['application']['package']}" do
  owner 'root'
  group 'root'
  mode '0644'
  source node['my-app']['application']['package_url']
  checksum node['my-app']['application']['package_sum']
  notifies :extract, "libarchive_file[#{node['my-app']['application']['package']}]"
end

# Unpack the application if new version fetched
libarchive_file node['my-app']['application']['package'] do
  path "#{Chef::Config[:file_cache_path]}/#{node['my-app']['application']['package']}"
  extract_to '/opt'
  owner 'root'
  group 'root'
  action :nothing
  notifies :run, 'execute[syncdb]'
end

# create the config ini from a template
template '/opt/conf/mysite/mysite.ini' do
  variables(
    :db_host => db_host
  )
  notifies :run, 'execute[wait_for_msyql]', :immediately
end

execute 'wait_for_msyql' do
  timeout 300
  command "while true; do nc -vz #{db_host} 3306 && sleep 20 && break; sleep 1; done"
  action :nothing
  notifies :run, 'execute[syncdb]', :immediately
end

# Sync the database if app is unpacked
execute 'syncdb' do
  command '/opt/mysite/manage.py syncdb --noinput'
  only_if do
    ::File.executable?('/opt/mysite/manage.py')
  end
  action :nothing
end
