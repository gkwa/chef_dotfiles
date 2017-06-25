default['chef_dotfiles']['dotfiles_path'] =
  if node['platform'] == 'windows'
    "#{ENV['HOME']}/Documents/dotfiles"
  else
    "#{ENV['HOME']}/dotfiles"
  end
