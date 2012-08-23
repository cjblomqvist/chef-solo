#
# Cookbook Name:: crontab
# Definition:: crontab
#


#sets the crontab for a user
define :crontab, :username => :root, :filename => nil do 
  
  filename = params[:filename]
  username = params[:username]
  
  crontabfile = "/tmp/chef-crontab-#{filename}" 
    
    template "crontab" do
      path crontabfile
      source filename
      mode 0655
      variables(variables)
    end
    
    execute "crontab" do
      command "crontab -u #{username} #{crontabfile}"
      action :run
      timeout 60
    end
  
end





