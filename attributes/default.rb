default['chef_dotfiles']['dotfiles_path'] =
  if node['platform'] != 'windows'
    "#{ENV['HOME']}/.config"
  else
    "#{ENV['LOCALAPPDATA']}\\dotfiles"
  end
