#
# Cookbook Name:: my-app
# Recipe:: balancer
#
# Copyright 2013 - 2014, Chef Software, Inc.
#
# All rights reserved - Do Not Redistribute
#

# This recipe will set up an apache load balancer
include_recipe 'apache2::default'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_balancer'
include_recipe 'apache2::mod_proxy_http'
include_recipe 'apache2::mod_headers'

# Fetch webservers with partial_search
if node['my-app']['balancer']['webservers'].empty?
  query = 'tags:myapp-appserver AND chef_environment:' + node.chef_environment

  Chef::Log.info('Using search to find webservers for load balancer: ' + query)
  web_servers = partial_search(
    :node, query, 
    :keys => { 'name' => ['name'],
              'ip'   => ['ipaddress'],
              'port' => ['my-app', 'webserver', 'apache_port']
    })
else
  Chef::Log.info('web servers specified')
  web_servers = node['my-app']['balancer']['webservers']
end

# Write out load balancer config
template '/etc/apache2/sites-available/mysite-proxy.conf' do
  variables(
    'web_servers' => web_servers,
    'max_attempts' => (web_servers.length - 1)
  )
  notifies :restart, 'service[apache2]'
end

# Enable load balancer
apache_site 'mysite-proxy' do
  notifies :restart, 'service[apache2]'
end
