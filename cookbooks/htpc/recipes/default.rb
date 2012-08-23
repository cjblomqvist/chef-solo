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

