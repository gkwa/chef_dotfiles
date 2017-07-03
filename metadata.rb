name 'chef_dotfiles'
maintainer 'Taylor Monacelli'
maintainer_email 'taylor.monacelli@streambox.com'
license 'All Rights Reserved'
description 'Installs/Configures chef_dotfiles'
long_description 'Installs/Configures chef_dotfiles'
version '0.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

issues_url 'https://github.com/taylormonacelli/chef_dotfiles/issues'
source_url 'https://github.com/taylormonacelli/chef_dotfiles'

supports 'fedora'
supports 'ubuntu'
supports 'windows'

license 'Apache-2.0'
depends 'windows'
depends 'chocolatey'
