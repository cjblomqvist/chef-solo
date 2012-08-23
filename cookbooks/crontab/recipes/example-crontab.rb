#
# Cookbook Name:: crontab
# Recipe:: example-crontab
#
# This shows an example usage for the crontab recipe.
# 1. As usual with Chef, create site-cookbooks/crontab/ and use this to change site specific configuration
# 2. Create a template under templates/default, which should contain the actual crontab file (as in crontab -l)
# 3. Create a recipe under recipes/ 
# 4. Use crontab definition with username and filename 
# 5. Assign the new recipe to some run list 
# Instead of templates/default you can also include your file in templates/host-node[:fqdn]/filename, so that you 
# can use the same recipe for all you servers

crontab "example-crontab" do 
  username :root 
  filename "example-crontab.erb"
end
