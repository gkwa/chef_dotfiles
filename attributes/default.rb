default['chef_dotfiles']['dotfiles_path'] =
  if node['platform'] == 'windows'
    "#{ENV['LOCALAPPDATA']}\\dotfiles"
  elsif node['platform'] == 'macOS'
    "#{ENV['LOCALAPPDATA']}/.config"
  else
    "/root/.config"
  end
