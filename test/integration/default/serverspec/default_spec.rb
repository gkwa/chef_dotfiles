require 'serverspec'

if os[:family] == 'windows'
  describe file('c:\Users\vagrant\.tmux.conf') do
    it { should be_a_file }
  end
elsif os[:family] == 'darwin'
  describe file('/Users/travis/.config/.tmux.conf') do
    it { should be_a_file }
  end
else
  describe file('/root/.config/.tmux.conf') do
    it { should be_a_file }
  end
end
