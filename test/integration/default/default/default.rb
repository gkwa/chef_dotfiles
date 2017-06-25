if os[:family] == 'windows'
  describe file('c:\Users\vagrant\Documents\dotfiles\.tmux.conf') do
    it { should be_a_file }
  end
else
  describe file('/root/dotfiles/.tmux.conf') do
    it { should be_a_file }
  end
end
