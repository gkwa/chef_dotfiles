package 'git'

file '/root/.bashrc' do
  action :delete
end

file '/root/.profile' do
  action :delete
end

git '/root' do
  repository 'https://github.com/taylormonacelli/dotfiles.git'
end
