#
# Cookbook Name:: force_default-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

file '/tmp/string_attribute' do
  content node['string']
end

file '/tmp/array_attribute' do
  content node['array'].join
end
