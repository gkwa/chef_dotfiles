include_recipe 'chef-sugar::default'
include_recipe 'chocolatey'

unless windows?
  package 'git'

else
  chocolatey_package 'git'

  windows_path 'C:\Program Files\Git\bin' do
    action :add
  end
end

git node['chef_dotfiles']['dotfiles_install_path'] do
  repository 'https://github.com/taylormonacelli/dotfiles.git'
  revision 'master'
  depth 50
  action :sync
end
