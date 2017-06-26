include_recipe 'chef_dotfiles::_base'

directory node['chef_dotfiles']['dotfiles_path'] do
  action :create
  recursive true
end

if node['platform'] == 'windows'

  powershell_script "clone dotfiles to \"#{node['chef_dotfiles']['dotfiles_path']}\"" do
    cwd node['chef_dotfiles']['dotfiles_path']
    code <<-EOH
      git init
      git remote add origin https://github.com/taylormonacelli/dotfiles.git
      git fetch --depth 50
      try {
        git checkout --force master
      } catch {
        $error.removeAt(0)
      }
      if (1 -le $error.count) {
        $error.removeAt(0)
      }
    EOH
    not_if 'test-path .git'
  end

else

  bash "clone dotfiles to \"#{node['chef_dotfiles']['dotfiles_path']}\"" do
    cwd node['chef_dotfiles']['dotfiles_path']
    code <<-EOH
      git init
      git remote add origin https://github.com/taylormonacelli/dotfiles.git
      git fetch --depth 50
      git checkout --force master
    EOH
    not_if 'test -d .git'
  end

end
