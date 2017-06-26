if node['platform'] != 'windows'
  package 'git'
else
  include_recipe 'chocolatey'

  chocolatey_package 'git'

  windows_path 'C:\Program Files\Git\bin' do
    action :add
  end
end
