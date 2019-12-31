# frozen_string_literal: true

#
# Cookbook Name:: nexus
# Recipe:: default
#
# Author:: Kyle Allan (<kallan@riotgames.com>)
# Copyright 2013, Riot Games
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node[:nexus][:use_chef_vault]
  chef_gem 'chef-vault' do
    action :purge
    compile_time true
    version '4.0.1'
  end

  chef_gem whitelist_gem do
    action :upgrade
    compile_time true
    version '3.4.3'
  end
end

include_recipe 'nexus::cli'
include_recipe 'nexus::app'
include_recipe 'nexus::app_server_proxy'
