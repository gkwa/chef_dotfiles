include_recipe 'chef_dotfiles::packages'

dfpath = node['chef_dotfiles']['dotfiles_path']

directory dfpath do
  action :create
  recursive true
end

case node['platform']
when 'windows'
  powershell_script "force checkout dotfiles to \"#{dfpath}\"" do
    cwd dfpath
    code <<-EOH
      git init
      git remote add origin #{node['chef_dotfiles']['repo_url']}
      git fetch --depth #{node['chef_dotfiles']['repo_depth']}
      $ec = $error.count
      git checkout --force #{node['chef_dotfiles']['repo_branch']}
      if ($ec -ne $error.count) {
        $error.removeAt(0)
      }
    EOH
    not_if { ::Dir.exist?('.git') }
  end

else
  bash "force checkout dotfiles to \"#{dfpath}\"" do
    cwd dfpath
    code <<-EOH
      git init
      git remote add origin #{node['chef_dotfiles']['repo_url']}
      git fetch --depth #{node['chef_dotfiles']['repo_depth']}
      git checkout --force #{node['chef_dotfiles']['repo_branch']}
    EOH
    not_if { ::Dir.exist?('.git') }
  end

end
