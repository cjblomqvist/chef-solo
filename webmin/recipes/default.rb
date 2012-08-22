#
# Cookbook Name:: webmin
# Recipe:: default
#
# Copyright 2008-2009, Opscode, Inc.
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

require 'chef/shell_out'

package "perl" do
  action :install
end

package "libnet-ssleay-perl" do
  action :install
end

package "openssl" do
  action :install
end

package "libauthen-pam-perl" do
  action :install
end

package "libpam-runtime" do
  action :install
end

package "libio-pty-perl" do
  action :install
end

package "apt-show-versions" do
  action :install
end

package "python" do
  action :install
end


#execute "apt-get update" do
#  action :nothing
#  ::File.directory?('/usr/share/webmin') do
#    
#  end
#end

