default['chef_dotfiles']['dotfiles_path'] =
  case node['platform']
  when 'windows'
    "#{ENV['LOCALAPPDATA']}\\dotfiles"
  else
    "#{ENV['HOME']}/.config"
  end
