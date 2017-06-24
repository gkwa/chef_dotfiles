include_recipe 'chef-sugar::default'

if windows?
  chocolatey_package 'git'
else
  package 'git'
end

execute 'git checkout' do
  cwd node['dotfiles_install_path']

  cmd = <<-EOH
  pwd
  EOH

  log = Mixlib::ShellOut.new(cmd)
  log.run_command
  Chef::Log.error "\n\n" + '=' * 80 + "\n\ndocker status: #{log.stdout}\n\n" + '=' * 80

  command <<-EOH
    git init
    git remote add origin https://github.com/taylormonacelli/dotfiles.git
    git fetch --depth 50
    git checkout --force origin/master
  EOH
end
