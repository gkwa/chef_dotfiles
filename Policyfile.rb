name 'chef_dotfiles'
default_source :supermarket
run_list 'chef_dotfiles::default'
named_run_list :run, 'chef_dotfiles::default'
cookbook 'chef_dotfiles', path: '.', branch: 'master'

default['chef_dotfiles']['dotfiles_install_path'] = 'c:\Users\Vagrant'
