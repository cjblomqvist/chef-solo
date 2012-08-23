#
# Cookbook Name:: htpc
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

# ==============================================================
# Mount all drives specified in attributes and add them to /etc/fstab
# ==============================================================
node["volumes"].each do |vol_name, vol|
  mount vol["mount_point"] do
    device      vol["device"]
    fstype      vol["fstype"]
    pass        vol["pass"]
    if vol.include? "options"
      options    vol["options"]
    end
    action      [:mount, :enable]
  end
end

# ==============================================================
# Install Node
# ==============================================================

# Add package to make sure add-apt-repository exists
package "python-software-properties"

# Add repository for node
ppa "chris-lea/node.js"

package "nodejs"
package "npm"

# ==============================================================
# Install MongoDB
# ==============================================================

# Add repository
apt_repository "mongodb" do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  distribution "dist"
  components ["10gen"]
  keyserver "keyserver.ubuntu.com"
  key "7F0CEB10"
  action :add
end

package "mongodb-10gen"

service "mongodb" do
  provider Chef::Provider::Service::Upstart
  action [:start, :enable]
end

# ==============================================================
# Configure XBMC
# ==============================================================

# Setup sources
template node["xbmc"]["path"] + ".xbmc/userdata/sources.xml" do
  source "sources.xml.erb"
end

# Setup configuration for advanced settings
## First install gem package xml-simple which is needed
gem_package "xml-simple"

## Then set up the actual file
template node["xbmc"]["path"] + ".xbmc/userdata/advancedsettings.xml" do
  source "advancedsettings.xml.erb"
end

# ==============================================================
# Install and configure FlexGet
# ==============================================================

# First, we'll need the python-pip and the python-dev packages
package "python-pip"
package "python-dev"

# Install FlexGet using pip
execute "pip" do
  command "pip install flexget"
end

# Setup the config file
## First, setup the directory where to put it
directory "/home/xbmc/.flexget" do
  recursive true
  owner "xbmc"
  group "xbmc"
end

## Then set up the actual file
template "/home/xbmc/.flexget/config.yml" do
  source "config.yml.erb"
end

## Then setup cron job for FlexGet 
crontab "flexget-crontab" do 
  username :root 
  filename "crontab.erb"
end
