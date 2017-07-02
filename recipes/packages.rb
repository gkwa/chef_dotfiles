case node[:platform]
when 'windows'
  include_recipe 'chocolatey'

  chocolatey_package 'git'

  windows_path 'C:\Program Files\Git\bin' do
    action :add
  end
else
  package 'git'
end
