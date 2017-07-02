include_recipe 'chef_dotfiles::packages'

directory node['chef_dotfiles']['dotfiles_path'] do
  action :create
  recursive true
end

title = "force checkout dotfiles to \"#{node['chef_dotfiles']['dotfiles_path']}\""

if node['platform'] == 'windows'

  powershell_script title do
    cwd node['chef_dotfiles']['dotfiles_path']
    code <<-EOH
      git init
      git remote add origin https://github.com/taylormonacelli/dotfiles.git
      git fetch --depth 50
      git checkout --force master
      if (1 -le $error.count) {
        $error.removeAt(0)
      }
    EOH
    not_if { ::Dir.exist?('.git') }
  end

else

  bash title do
    cwd node['chef_dotfiles']['dotfiles_path']
    code <<-EOH
      git init
      git remote add origin https://github.com/taylormonacelli/dotfiles.git
      git fetch --depth 50
      git checkout --force master
    EOH
    not_if { ::Dir.exist?('.git') }
  end

end
