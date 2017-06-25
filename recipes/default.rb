include_recipe 'chocolatey'

if node['platform'] != 'windows'
  package 'git'
else

  chocolatey_package 'git'

  windows_path 'C:\Program Files\Git\bin' do
    action :add
  end
end

git "#{node['chef_dotfiles']['dotfiles_path']}/0Y3hyaPYRYjq5oRI9Qc17oqMvyg" do
  repository 'https://github.com/taylormonacelli/dotfiles.git'
  depth 10
  action :sync
  not_if { ::Dir.exist?("#{node['chef_dotfiles']['dotfiles_path']}/.git") }
end

execute "mv .git #{node['chef_dotfiles']['dotfiles_path']}" do
  cwd "#{node['chef_dotfiles']['dotfiles_path']}/0Y3hyaPYRYjq5oRI9Qc17oqMvyg"
  not_if { ::Dir.exist?("#{node['chef_dotfiles']['dotfiles_path']}/.git") }
end

directory "#{node['chef_dotfiles']['dotfiles_path']}/0Y3hyaPYRYjq5oRI9Qc17oqMvyg" do
  action :delete
  not_if { ::Dir.exist?("#{node['chef_dotfiles']['dotfiles_path']}/.git") }
end
