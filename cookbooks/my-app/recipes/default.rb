#
# Cookbook Name:: my-app
# Recipe:: default
#
# Copyright 2013 - 2014, Chef Software, Inc.
#
# All rights reserved - Do Not Redistribute
#

# This recipe will create a simple web app on a single server

# Install database
include_recipe 'my-app::database'

# Install Python application
node.set['my-app']['database']['db_host'] = 'localhost'
include_recipe 'my-app::application'

# Install webserver
include_recipe 'my-app::webserver'

# # Install load balancer
node.set['my-app']['balancer']['webservers'] = [
  { 'name' => 'localhost',
    'ip' => '127.0.0.1',
    'port' => node['my-app']['webserver']['apache_port']
  }]
include_recipe 'my-app::balancer'
