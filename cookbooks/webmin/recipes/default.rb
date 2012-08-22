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

# Install packages webmin depends on
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

# Add repositories for webmin
apt_repository "webmin1" do
  uri "http://download.webmin.com/download/repository"
  distribution "sarge"
  components ["contrib"]
  key "http://www.webmin.com/jcameron-key.asc"
  action :add
end

apt_repository "webmin2" do
  uri "http://webmin.mirror.somersettechsolutions.co.uk/repository"
  distribution "sarge"
  components ["contrib"]
  key "http://www.webmin.com/jcameron-key.asc"
  action :add
end

# Reload package list through 'apt-get update'
include_recipe "apt::default"

# Install webmin
package "webmin" do
  action :install
end