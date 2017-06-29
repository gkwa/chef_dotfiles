default['chef_dotfiles']['dotfiles_path'] =
  if node['platform'] == 'windows'
    "#{ENV['LOCALAPPDATA']}\\dotfiles"
  else
    "#{ENV['HOME']}/.config"
  end
