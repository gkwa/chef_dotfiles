require 'serverspec'

# Required by serverspec
set :backend, :exec

case node['platform']
when 'windows'
  set :os, family: 'windows'
end
