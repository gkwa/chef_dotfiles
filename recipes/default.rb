include_recipe 'chef-sugar::default'
include_recipe 'windows'

if windows?
  chocolatey_package 'git'

  windows_path 'C:\Program Files\Git\bin' do
    action :add
  end

else
  package 'git'
end

git node['chef_dotfiles']['dotfiles_install_path'] do
  repository 'https://github.com/taylormonacelli/dotfiles.git'
  revision 'master'
  depth 50
  action :sync
end
