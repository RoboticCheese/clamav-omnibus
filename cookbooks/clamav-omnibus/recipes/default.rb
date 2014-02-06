# -*- encoding: utf-8 -*-
#
# Cookbook Name:: clamav-omnibus
# Recipe:: default
#
# Copyright 2014, Jonathan Hartman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'omnibus'

execute 'Run Omnibus builder' do
  command <<-OMNIBUS_BUILD
    export PATH=/usr/local/bin:$PATH
    cd #{node['omnibus']['build_dir']} && \
    su #{node['omnibus']['build_user']} -c "bundle install --binstubs" && \
    su #{node['omnibus']['build_user']} \
      -c "bin/omnibus build project #{node['omnibus']['project_name']}"
  OMNIBUS_BUILD
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
