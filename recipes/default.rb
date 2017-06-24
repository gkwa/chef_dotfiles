include_recipe 'chef-sugar::default'

if windows?
  chocolatey_package 'git'
else
  package 'git'
end

powershell_script 'git checkout dotfiles' do
  code <<-EOH
  $env:PATH="C:\\Program Files\\Git\\bin;$env:PATH"
  $env:PATH="C:\\Program Files (x86)\\Git\\bin;$env:PATH"
  cd "#{node['chef_dotfiles']['dotfiles_install_path']}"
  git init
  git remote add origin https://github.com/taylormonacelli/dotfiles.git
  git fetch --depth 50
  $(git checkout --force --track origin/master ) -Or $(git checkout master)
  EOH
  not_if "test-path \"#{node['chef_dotfiles']['dotfiles_install_path']}\\.git\""
end
