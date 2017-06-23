include_recipe 'chef-sugar::default'

if windows?
  chocolatey_package 'git'
else
  package 'git'
end

execute 'git checkout' do
  cwd ENV['HOME']
  command <<-EOH
    git init
    git remote add origin https://github.com/taylormonacelli/dotfiles.git
    git fetch --depth 50
    git checkout --force origin/master
  EOH
end
