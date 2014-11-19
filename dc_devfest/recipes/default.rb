#
# Cookbook Name:: dc_devfest
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'pdb_motd'
include_recipe 'dc_devfest::dbserver'
include_recipe 'dc_devfest::app-server'
include_recipe 'dc_devfest::http-server'
