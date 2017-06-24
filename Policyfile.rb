name 'chef_dotfiles'
default_source :supermarket
run_list 'test::default'
named_run_list :test, 'test::default'
cookbook 'chef_dotfiles', path: '.', branch: 'master'

default['dotfiles_install_path'] = 'c:\Users\Vagrant'
