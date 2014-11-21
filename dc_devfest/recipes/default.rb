#
# Cookbook Name:: dc_devfest
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

#include_recipe 'dc_devfest::database'
include_recipe 'dc_devfest::myapp-a'
include_recipe 'dc_devfest::myapp-b'
include_recipe 'dc_devfest::webserver'
