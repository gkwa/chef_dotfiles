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
      git checkout --force #{node['chef_dotfiles']['repo_branch']}
    EOH
    returns [0, 1]
    not_if { ::Dir.exist?("#{node['chef_dotfiles']['dotfiles_path']}/.git") }
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
    not_if { ::Dir.exist?("#{node['chef_dotfiles']['dotfiles_path']}/.git") }
  end

end
