include_recipe 'chocolatey'

if node['platform'] != 'windows'
  package 'git'
else

  chocolatey_package 'git'

  windows_path 'C:\Program Files\Git\bin' do
    action :add
  end
end

git "#{node['chef_dotfiles']['dotfiles_path']}/.git" do
  repository 'https://github.com/taylormonacelli/dotfiles.git'
  action :sync
end

execute 'git config core.bare false' do
  cwd "#{node['chef_dotfiles']['dotfiles_path']}/.git"
end

execute 'git reset --hard --quiet' do
  cwd node['chef_dotfiles']['dotfiles_path']
  returns [0, 128]
end
