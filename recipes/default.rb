include_recipe 'chef-sugar::default'

if windows?
  chocolatey_package 'git'
else
  package 'git'
end

git node['chef_dotfiles']['dotfiles_install_path'] do
  repository 'https://github.com/taylormonacelli/dotfiles.git'
  revision 'master'
  depth 50
  action :sync
end
