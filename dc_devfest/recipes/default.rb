#
# Cookbook Name:: dc_devfest
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'dc_devfest::dbserver'
include_recipe 'dc_devfest::appserverA'
include_recipe 'dc_devfest::appserverB'
include_recipe 'dc_devfest::webserver'
