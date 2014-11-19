#
# Cookbook Name:: my-app
# Recipe:: database
#
# Copyright 2013 - 2014, Chef Software, Inc.
#
# All rights reserved - Do Not Redistribute
#

# This recipe will create a mysql database server and add a database and a user

include_recipe 'mysql::client'
include_recipe 'mysql::server'

# we'll need to create databases and add users
include_recipe 'database::mysql'

database_host = 'localhost' unless node['my-app']['database']['db_host']

# create a variable rather than retype all this every time
mysql_connection_info = { :host => database_host,
                          :username => 'root',
                          :password => node['mysql']['server_root_password'] }

# create a database using connection info from above
mysql_database node['my-app']['database']['db_schema_name'] do
  connection mysql_connection_info
  action :create
end

# add our user with access from any host
mysql_database_user node['my-app']['database']['db_user'] do
  connection mysql_connection_info
  password node['my-app']['database']['db_pass']
  database_name node['my-app']['database']['db_schema_name']
  host '%'
  privileges [:all]
  action :grant
end

# add our user with access from localhost
mysql_database_user node['my-app']['database']['db_user'] do
  connection mysql_connection_info
  password node['my-app']['database']['db_pass']
  database_name node['my-app']['database']['db_schema_name']
  host 'localhost'
  privileges [:all]
  action :grant
end
