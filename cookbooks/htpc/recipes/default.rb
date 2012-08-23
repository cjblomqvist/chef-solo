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

node["volumes"].each do |vol_name, vol|
  mount vol["mount_point"] do
    device      vol["device"]
    fstype      vol["fstype"]
    not_if do
      File.Directory? vol["mount_point"]
    end
    action      [:mount, :enable]
  end
end





#, "volumes": {
#        "HTPC": {
#            "mount_point": "/media"
#          , "device": "/dev/sda3"
#        }
#    }
  


#package "samba"
#package "smbfs"


