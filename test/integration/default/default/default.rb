if os[:family] == 'windows'

  describe file('c:\Users\vagrant\.tmux.conf') do
    it { should be_a_file }
  end

else

  describe file('/root/.tmux.conf') do
    it { should be_a_file }
  end

end
