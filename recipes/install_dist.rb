#
# Author:: Andras Kerekes (<andras.kerekes@ishisystems.com>)
# Cookbook Name:: R
# Recipe:: dist
#
# Copyright 2014, Andras Kerekes (<andras.kerekes@ishisystems.com>) 
# Copyright 2011-2013, Steven S. Danna (<steve@opscode.com>)
# Copyright 2013, Mark Van de Vyver (<mark@taqtiqa.com>)
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

Chef::Application.fatal!("If installing 'dist' then the R version must be set in attribute node['r']['version']") if node['r']['version'].nil?

Chef::Application.fatal!("If installing 'dist' then the corresponding versioned list of dependencies must exist in attribute node['r']['dist'][#{node['r']['version']}]") if node['r']['dist'][node['r']['version']].nil?

ruby_block "install r dist" do
  block do
    `#{"apt-get -q -y install " + node['r']['dist'][node['r']['version']].map{|k,v| "#{k}=#{v}"}.join(' ')}`
  end
  action :run
end


