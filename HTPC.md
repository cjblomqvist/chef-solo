Instructions for reinstalling everything on my HTPC
=========

## 1. Install XBMCbuntu

## 2. Install rvm, ruby (latest?) & git (as well as other dependencies)
```
curl -L https://get.rvm.io | bash -s stable --ruby
source /home/xbmc/.rvm/scripts/rvm
sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config

```

#### Because of weirdness with zlib:
```
rvm pkg install zlib
rvm reinstall 1.9.3

```

## 3. Install Chef Solo and Chef( Client)
```
sudo apt-get install ruby ruby-dev libopenssl-ruby rdoc ri irb ssl-cert
rvmsudo gem install chef --no-ri --no-rdoc

```

## 4. Setup Chef Solo 
```
nano solo.rb

```
-- Insert data from git repo
```
nano node.json

```
-- Insert data from git repo

## 5. Run Chef Solo - including downloading latest version of cookbooks from github
```
sudo rm -r /var/chef-solo/cookbooks
wget https://github.com/cjblomqvist/chef-solo/tarball/master -P /tmp/
tar -C /tmp -xvf /tmp/master
sudo rm /tmp/master
sudo mv /tmp/cjblomqvist-chef-solo-* /var/chef-solo/cookbooks 
rvmsudo chef-solo -c /var/chef-solo/cookbooks/solo.rb -j /var/chef-solo/cookbooks/node.json

```

## Old





4.1 In Git Repo, create
---- Node.json (to be linked to from) -- Needs to be private? Can be put on citro.se/node.json until we know better - if we have in priv repo then we need to setup git properly first



---- $ rvmsudo gem install PLUGIN_NAME 
-------- knife-ec2
-------- knife-windows



